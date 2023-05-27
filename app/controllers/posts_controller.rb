class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[index create show]
  def index
    set_user
    @posts = @user.posts.includes(:author).paginate(page: params[:page], per_page: 3)
  end

  def show
    set_post
  end

  def destroy
    @post = Post.find(params[:id])
    @user = @post.author
    @post.destroy
    @user.posts_counter -= 1
    redirect_to user_posts_path(@user) if @user.save
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  private

  def set_post
    @post = Post.includes(:author).find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
