require 'rails_helper'

RSpec.describe "Api::V1::Members", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/members/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/members/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/members/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/members/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/api/v1/members/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
