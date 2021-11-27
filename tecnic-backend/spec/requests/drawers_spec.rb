require 'rails_helper'

RSpec.describe "Drawers", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/drawers/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/drawers/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
