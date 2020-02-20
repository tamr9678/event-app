class Profile < ApplicationRecord
  # validation
  validates :place,          presence: true, length: {maximum: 50}
  validates :introduction,   presence: true, length: {maximum: 200}
  # assosiation
  belongs_to :user, optional: true
end
