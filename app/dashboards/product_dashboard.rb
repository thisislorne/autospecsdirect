require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    features: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    slug: Field::String,
    description: Field::Text,
    version_number: Field::String,
    app_name: Field::String,
    mac: Field::Boolean,
    windows: Field::Boolean,
    file_name_mac: Field::String,
    file_name_windows: Field::String,
    file_size: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :features,
    :id,
    :title,
    :slug,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :slug,
    :description,
    :version_number,
    :app_name,
    :mac,
    :windows,
    :file_name_mac,
    :file_name_windows,
    :file_size
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :slug,
    :description,
    :version_number,
    :app_name,
    :mac,
    :windows,
    :file_name_mac,
    :file_name_windows,
    :file_size
  ].freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(product)
    "#{product.title}"
  end
end
