require 'rails_helper'

RSpec.describe "Api::V1::ArticlesControllers", type: :request do
  before do
    allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
  end

  let!(:category) { create(:category) }
  let!(:author) { create(:author) }
  let!(:articles) { create_list(:article, 5, category: category, author: author) }

  describe "GET /index" do
    it "returns a list of articles" do
      get "/api/v1/articles"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it "filters articles by category_id" do
      get "/api/v1/articles", params: { category_id: category.id }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe "GET /show" do
    it "returns a specific article" do
      article = articles.first
      get "/api/v1/articles/#{article.id}"
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response["id"]).to eq(article.id)
      expect(json_response["title"]).to eq(article.title)
    end

    it "returns a 404 if the article is not found" do
      get "/api/v1/articles/9999"
      expect(response).to have_http_status(:not_found)
    end
  end
end
