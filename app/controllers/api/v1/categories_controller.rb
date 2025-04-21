class Api::V1::CategoriesController < ApplicationController
  # GET /api/v1/categories
  # Fetches all categories and returns them as JSON.
  def index
    categories = Category.all
    render json: categories
  end
end