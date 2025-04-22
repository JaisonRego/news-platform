require 'rails_helper'

RSpec.describe "Api::V1::AuthorsControllers", type: :request do
  let!(:author) { create(:author) }

  describe "GET /show" do
    context "when the author exists" do
      it "returns the author details" do
        get "/api/v1/authors/#{author.id}"
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response["id"]).to eq(author.id)
        expect(json_response["name"]).to eq(author.name)
      end
    end

    context "when the author does not exist" do
      it "returns a 404 status" do
        get "/api/v1/authors/9999"
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
