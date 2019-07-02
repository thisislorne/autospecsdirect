class Query < ApplicationRecord
  validates :query, :weighting, :search_id, presence: true

  belongs_to :search
  has_many :optimised_queries

  before_save :strip_query
  
  def rpc
    return nil
  end

  private

  def strip_query
    self.query_stripped = self.query.downcase.gsub(/\s+/, "").gsub("'", '')
  end


end