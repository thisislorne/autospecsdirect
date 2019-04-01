class Search < ApplicationRecord
  validates :slug, presence: true
  has_many :queries
  accepts_nested_attributes_for :queries
end