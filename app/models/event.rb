class Event < ApplicationRecord
  mount_uploader :img, ImgUploader
  geocoded_by :place
  after_validation :geocode, if: :place_changed?
  
  # validation
  validates :title,          presence: true, length: {maximum: 50}
  validates :place,          presence: true, length: {maximum: 50}
  validates :event_start_at, presence: true
  validates :expire_at,      presence: true
  validates :discription,    presence: true, length: {maximum: 500}
  validates :capacity,       presence: true
  validate :start_expire_check

  # method
  def start_expire_check
    errors.add(:expire_at, "の日時は開催日時以前に設定してください。") unless
    self.event_start_at > self.expire_at
  end

  def entry_status(participants)
    if Time.current > self.event_start_at 
      return 0
    elsif Time.current > self.expire_at
      return 1
    elsif self.capacity <= participants.count
      return 2
    else
      return 3
    end
  end

  # assosiation
  belongs_to :organizer, class_name: "User"
  has_many :participants
  has_many :users, through: :participants
  has_many :favorites
  has_many :users, through: :favorites


end
