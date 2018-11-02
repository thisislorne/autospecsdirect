class Product < ApplicationRecord
  validates :title,
  :slug,
  presence: true
end
