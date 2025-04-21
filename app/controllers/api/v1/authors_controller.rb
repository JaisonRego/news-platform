class Api::V1::AuthorsController < ApplicationController
  # GET /api/v1/authors/:id
  # Fetches a single author by their ID and returns it as JSON.
  def show
    author = Author.find(params[:id])
    render json: author
  end
end
