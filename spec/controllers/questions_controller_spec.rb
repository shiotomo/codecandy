require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  before do
    @user = create(:user)
    @admin = create(:admin)
    create(:question, id: 0)
  end

  describe "GET #show" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :show, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        get :show, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http 200" do
        get :show, params: { id: 0 }
        expect(response).to have_http_status(200)
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

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        get :new
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http 200" do
        get :new
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #edit" do
    context 'ログインしていない' do
      it "returns http redirect" do
        get :edit, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        get :edit, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http 200" do
        get :edit, params: { id: 0 }
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        get :edit, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http 200" do
        get :edit, params: { id: 0 }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST #create" do
    context 'ログインしていない' do
      it "returns http redirect" do
        post :create, params: { question: { title: "piyo" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        post :create, params: { question: { title: "piyo" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http redirect" do
        post :create, params: { question: { title: "piyo" } }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "PUT #update" do
    context 'ログインしていない' do
      it "returns http redirect" do
        put :update, params: { id: 0, question: { title: "fuga" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        put :update, params: { id: 0, question: { title: "fuga" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http redirect" do
        put :update, params: { id: 0, question: { title: "fuga" } }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "DELETE #destroy" do
    context 'ログインしていない' do
      it "returns http redirect" do
        delete :destroy, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしているが管理者ではない' do
      before do
        session[:user_id] = @user.id
      end

      it "returns http redirect" do
        delete :destroy, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'ログインしていて管理者である' do
      before do
        session[:user_id] = @admin.id
      end

      it "returns http 200" do
        delete :destroy, params: { id: 0 }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

end
