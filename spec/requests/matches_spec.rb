require 'rails_helper'

RSpec.describe "Matches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/matches"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /matches" do
    it "returns http success" do
      post "/matches", params: { match: { winner_id: 1, loser_id: 2 } }
      expect(response).to have_http_status(:found)
    end
  end

end
