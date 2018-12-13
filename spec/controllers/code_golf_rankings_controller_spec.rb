require 'rails_helper'

RSpec.describe CodeGolfRankingsController, type: :controller do

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
end
