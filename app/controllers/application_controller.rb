# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Protects against CSRF (Cross-Site Request Forgery) attacks
  protect_from_forgery with: :exception

  # Include Devise's authentication method
  before_action :authenticate_user!

  # Redirects users to the root path after signing in
  def after_sign_in_path_for(resource)
    root_path
  end
end
