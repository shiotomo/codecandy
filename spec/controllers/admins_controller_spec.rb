require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  before do
    @admin = create(:admin, id: 1)
    @user = create(:user, id: 2)
    @question = create(:question, id: 1)
  end

  describe "GET #index" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #user" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :user, params: { id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        get :user, params: { id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http 200" do
        get :user, params: { id: 1 }
        expect(response).to have_http_status(200)
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

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        get :answer, params: { id: 1, user_id: 1 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http 200" do
        get :answer, params: { id: 1, user_id: 1 }
        expect(response).to have_http_status(200)
      end
    end
  end
end
