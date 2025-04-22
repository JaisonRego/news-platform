# The HomeController handles requests to the root path of the application.
# It is typically used to render the homepage or dashboard.
class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  # GET /
  # Renders the homepage.
  def index
    # Add any logic here if needed for the homepage.
  end
end
