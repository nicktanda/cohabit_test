class UserAffiliationJoin < ApplicationRecord
  validates :user, presence: true
  validates :affiliation, presence: true

  belongs_to :user
  belongs_to :affiliation
end
