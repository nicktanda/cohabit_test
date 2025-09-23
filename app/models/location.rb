class Location < ApplicationRecord
  has_many :user_location_joins
  has_many :users, through: :user_location_joins
end
