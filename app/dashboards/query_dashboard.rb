require "administrate/base_dashboard"

class QueryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    search: Field::BelongsTo,
    id: Field::Number,
    query: Field::String,
    optimised_queries: Field::HasMany,
    weighting: Field::Number,
    optimisation_enabled: Field::Boolean,
    enabled: Field::Boolean,
    query_stripped: Field::Text,
    
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :query,
    :weighting,
    :enabled,
    :optimised_queries,
    :optimisation_enabled
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :search,
    :id,
    :query,
    :weighting,
    :enabled,
    :optimised_queries,
    :optimisation_enabled,
    :query_stripped
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :search,
    :query,
    :weighting,
    :enabled,
    :optimisation_enabled,
  ].freeze

  # Overwrite this method to customize how queries are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(query)
    "#{query.query}"
  end
end
