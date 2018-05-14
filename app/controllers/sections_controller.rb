class SectionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @category = Category.find(params[:id])
  end
end
