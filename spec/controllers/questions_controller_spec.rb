require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:redirect)
    end
  end

end
