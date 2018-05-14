class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :all_questions, only: [:new, :edit]

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_path
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admins_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admins_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def all_questions
    @questions = Question.all
  end

  def category_params
    params.require(:category).permit(:title, { question_ids: [] })
  end
end
