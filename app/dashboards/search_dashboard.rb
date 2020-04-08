require "administrate/base_dashboard"

class SearchDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    queries: Field::HasMany.with_options(limit: 30),
    # optimised_queries: Field::HasMany.with_options(limit: 30),
    optimised_queries: Field::OptimisedQueriesField,
    # queries: Field::NestedHasMany.with_options(limit: 20),
    id: Field::Number,
    slug: Field::String,
    optimisation_enabled: Field::Boolean,
    p_val: Field::Number,
    updated_at: Field::DateTime,
    created_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :slug, 
    :queries,
    :optimisation_enabled
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :slug,
    :queries,
    :p_val,
    :optimised_queries,
    :optimisation_enabled,
    :updated_at
  ].freeze


  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :slug,
    :p_val,
    :queries,
    :optimisation_enabled
  ].freeze

  # Overwrite this method to customize how searches are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(search)
    "https://searchbe.com/search?q=#{URI.encode(search.slug)}"
  end
end
