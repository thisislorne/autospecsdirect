class Query < ApplicationRecord
  validates :query, :weighting, :search_id, presence: true
  belongs_to :search
end