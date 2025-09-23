class UserLocationJoin < ApplicationRecord
  validates :user, presence: true
  validates :location, presence: true

  belongs_to :user
  belongs_to :location
end
