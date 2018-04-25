class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Lesson.all.order(updated_at: 'desc')
  end

  def show
  end

  def new
    @lesson = Lessson.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
  end
end
