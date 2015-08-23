require_relative 'spec_helper'

describe "items_controller" do

  describe "GET /items" do
    it "renders a successful status" do
      get '/items'
      expect(last_response.status).to eq(200)
    end

    it "queries LoL API for item info" do
      pending
    end
  end

end