require 'rails_helper'

RSpec.describe AdminsController, type: :controller do

  describe "GET #index" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "GET #show" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "GET #answer" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :answer, params: { id: 1, user_id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

end
