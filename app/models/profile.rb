class Profile < ApplicationRecord
  # assosiation
  belongs_to :user, optional: true
end
