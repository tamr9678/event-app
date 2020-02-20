class Profile < ApplicationRecord
  # validation
  validates :place,          length: {maximum: 50}
  validates :introduction,   length: {maximum: 200}
  # assosiation
  belongs_to :user, optional: true
end
