# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    http_basic_authenticate_with(
      name: Rails.application.credentials.production[:admin][:name],
      password: Rails.application.credentials.production[:admin][:password]
      )
  end
end