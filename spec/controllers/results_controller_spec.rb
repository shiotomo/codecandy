require 'rails_helper'

RSpec.describe ResultsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #code" do
    it "returns http success" do
      get :code
      expect(response).to have_http_status(:success)
    end
  end

end
