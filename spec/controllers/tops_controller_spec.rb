require 'rails_helper'

RSpec.describe TopsController, type: :controller do

  describe "GET #index" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしている' do
      before do
        @user = FactoryBot.create(:user)
        session[:user_id] = @user.id
      end

      it "returns http 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end

end
