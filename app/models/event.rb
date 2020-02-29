class Event < ApplicationRecord
  mount_uploader :img, ImgUploader

  # validation
  validates :title,          presence: true, length: {maximum: 50}
  validates :place,          presence: true, length: {maximum: 50}
  validates :event_start_at, presence: true
  validates :event_end_at,   presence: true
  validates :expire_at,      presence: true
  validates :discription,    presence: true, length: {maximum: 500}
  validates :capacity,       presence: true
end
