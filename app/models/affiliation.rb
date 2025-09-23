class Affiliation < ApplicationRecord
  has_many :user_affiliation_joins
  has_many :users, through: :user_affiliation_joins
end
