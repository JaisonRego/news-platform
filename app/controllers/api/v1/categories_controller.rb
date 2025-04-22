class Api::V1::CategoriesController < ApplicationController
  # Skip authentication only for the index action
  skip_before_action :authenticate_user!, only: [:index]

  # GET /api/v1/categories
  # Fetches all categories and returns them as JSON.
  def index
    categories = Category.all
    render json: categories
  end
end