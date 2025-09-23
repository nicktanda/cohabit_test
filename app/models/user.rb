class User < ApplicationRecord
  validates :first_name, presence: true
  validates :species, presence: true
  validates :gender, presence: true

  enum :gender, {
    male: 0,
    female: 1,
    other: 2
  }

  has_many :user_location_joins
  has_many :locations, through: :user_location_joins

  has_many :user_affiliation_joins
  has_many :affiliations, through: :user_affiliation_joins

  paginates_per 10

  def self.full_name
    "#{first_name} #{last_name}"
  end
end
