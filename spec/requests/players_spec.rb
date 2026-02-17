require 'rails_helper'

RSpec.describe "Players", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/players"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /players" do
    it "returns http success" do
      post "/players", params: { player: { name: "Test Player" } }
      expect(response).to have_http_status(:found)
    end
  end

  describe "delete /players/:id" do
    it "returns http 404" do
      delete "/players/1"
      expect(response).to have_http_status(:not_found)
    end
  end

end
