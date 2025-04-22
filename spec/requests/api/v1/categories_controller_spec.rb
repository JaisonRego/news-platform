require 'rails_helper'

RSpec.describe "Api::V1::CategoriesControllers", type: :request do
  let!(:categories) { create_list(:category, 5) } # Create 5 categories using FactoryBot

  describe "GET /index" do
    context "when categories exist" do
      it "returns a list of categories" do
        get "/api/v1/categories"
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response.size).to eq(5)
        expect(json_response.first).to have_key("id")
        expect(json_response.first).to have_key("name")
      end
    end

    context "when no categories exist" do
      before { Category.delete_all } # Clear all categories from the database

      it "returns an empty array" do
        get "/api/v1/categories"
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response).to eq([])
      end
    end
  end
end
