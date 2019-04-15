require "administrate/base_dashboard"

class OptimisedQueryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    query: Field::BelongsTo,
    id: Field::Number,
    weighting: Field::Number,
    adgroup_id: Field::Text,
    updated_at: Field::DateTime,
    created_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :query,
    :adgroup_id,
    :weighting,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :query,
    :adgroup_id,
    :weighting,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :weighting,
  ].freeze

  # Overwrite this method to customize how queries are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(optimised_query)
    "query #{optimised_query.query.query}"
  end
end
