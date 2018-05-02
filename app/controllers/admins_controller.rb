class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @users = User.all.order(created_at: 'asc')
  end
end
