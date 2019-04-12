class OptimisedQuery < ApplicationRecord
  validates :query_id, :weighting, :adgroup_id, presence: true
  belongs_to :query
  has_one :search, :through => :query

end