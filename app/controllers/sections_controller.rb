class SectionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.page(params[:page]).order(created_at: 'asc')
  end

  def show
    @category = Category.friendly.find(params[:id])
  end
end
