class Link < ApplicationRecord
  belongs_to :product

  def url_source
    "#{self.url}?utm_source=werecommend.co.nz"
  end
end
