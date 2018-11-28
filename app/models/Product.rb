class Product < ApplicationRecord
  has_many :features
  validates :title,
  :slug,
  presence: true
end
