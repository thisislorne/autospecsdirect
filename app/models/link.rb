class Link < ApplicationRecord
  belongs_to :product

  def url_source
    "#{self.url}?utm_source=werecommend"
  end
end
