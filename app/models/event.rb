class Event < ApplicationRecord
  mount_uploader :img, ImgUploader

  # validation
  validates :title,          presence: true, length: {maximum: 50}
  validates :place,          presence: true, length: {maximum: 50}
  validates :event_start_at, presence: true
  validates :expire_at,      presence: true
  validates :discription,    presence: true, length: {maximum: 500}
  validates :capacity,       presence: true
  validate :start_expire_check

  def start_expire_check
    errors.add(:expire_at, "の日時は開催日時以前に設定してください。") unless
    self.event_start_at > self.expire_at
  end

  # assosiation
  belongs_to :organizer, class_name: "User"
  has_many :users, through: :participants
  has_many :participants
  has_many :users, through: :favorites
  has_many :favorites
end
