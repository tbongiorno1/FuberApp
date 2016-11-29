class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_course
  before_action :authenticate_admin!, only: [:create, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @post = @course.posts.new(params[:post])
    @post.admin = current_admin
  end

  def edit
  end

  def create
    @course.posts.sort { |a, b| a.order <=> b.order }
    last_post = @course.posts.last

    @post = @course.posts.new(post_params)

    if !last_post.nil?
      @post.order = last_post.order + 1
    else
      @posts.order = 1
    end

    @post.admin = current_admin

    if @post.save
      redirect_to [@course, @post], notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to [@course, @post], notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to course_path(@course), notice: 'Course post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def set_course
    @course = Course.friendly.find(params[:course_id])
  end

  def post_params
    params.require(:post).permit(:name, :content)
  end
end
