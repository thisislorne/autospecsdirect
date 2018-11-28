class Product < ApplicationRecord
  validates :title,
  :slug,
  presence: true

  has_many :features
end
