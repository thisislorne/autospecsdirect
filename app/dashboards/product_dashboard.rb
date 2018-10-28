require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    reviews: Field::HasMany,
    links: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    image: Field::Text,
    brand: Field::String,
    brand_image: Field::Text,
    rating: Field::String,
    order: Field::Number,
    points: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :reviews,
    :links,
    :id,
    :title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :reviews,
    :links,
    :id,
    :title,
    :description,
    :image,
    :brand,
    :brand_image,
    :rating,
    :order,
    :points,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :reviews,
    :links,
    :title,
    :description,
    :image,
    :brand,
    :brand_image,
    :rating,
    :order,
    :points,
  ].freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
end
