class Product < ApplicationRecord
  validates :title,
  :description,
  :image,
  :brand,
  :brand_image,
  :rating,
  :num_reviews,
  presence: true

  has_many :reviews
  has_many :links
end
