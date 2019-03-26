class Search < ApplicationRecord
  validates :slug, presence: true
  has_many :queries
end