class Product < ApplicationRecord
  validates :title,
  :description,
  :image,
  :brand,
  :brand_image,
  :rating,
  presence: true

  has_many :reviews
  has_many :links
end
