class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:create, :update, :destroy]

  def index
    @q = Course.ransack(params[:q])
    @courses = @q.result(distinct: true).includes(:admin).order(created_at: :desc)
  end

  def show
  end

  def new
    @course = current_admin.courses.new(params[:course])
    @course.admin = current_admin
  end

  def edit
  end

  def create
    @course = current_admin.courses.new(course_params)
    @course.admin = current_admin

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private
    def set_course
      @course = Course.friendly.find(params[:id])
    end

    def course_params
      params.require(:course).permit(
        :name,
        :tagline,
        :description,
        :course_image,
        :course_image_cache_id,
        :remove_course_image
      )
    end
end
