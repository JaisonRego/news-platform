require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get "/"
      expect(response).to render_template(:index)
    end

    it "includes the welcome message in the response body" do
      get "/"
      expect(response.body).to include("Welcome to News Platform")
    end

    it "includes a link to explore articles" do
      get "/"
      expect(response.body).to include('<a href="/api/v1/articles" class="btn btn-primary btn-lg">Explore Articles</a>')
    end
  end
end
