require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #show" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "GET #new" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :new
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "GET #edit" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :edit, params: { id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "POST #create" do
    context 'ログインしていない' do
      it "returns http redirect" do
        post :create, params: { id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "PUT #update" do
    context 'ログインしていない' do
      it "returns http redirect" do
        put :update, params: { id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "DELETE #destroy" do
    context 'ログインしていない' do
      it "returns http redirect" do
        delete :destroy, params: { id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

end
