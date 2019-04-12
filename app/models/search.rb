class Search < ApplicationRecord
  validates :slug, presence: true
  has_many :queries
  has_many :optimised_queries, through: :queries
  accepts_nested_attributes_for :queries
end