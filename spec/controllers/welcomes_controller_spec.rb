require 'rails_helper'

RSpec.describe WelcomesController, type: :controller do

  describe "GET #index" do
    context 'ログインしていない' do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end

end
