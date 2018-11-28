class Feature < ApplicationRecord
  belongs_to :product
  validates :header,
  :content,
  :product_id,
  presence: true
end
