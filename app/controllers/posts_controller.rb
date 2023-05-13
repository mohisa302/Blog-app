class PostsController < ApplicationController
  def index
    # Set instance variable @user (assuming you have a User model)
    @user = User.find(params[:user_id])
    # Set instance variable @posts (assuming you have a Post model)
    @posts = @user.posts
    # Render the index view
  end

  def show
    # Set instance variable @user (assuming you have a User model)
    @user = User.find(params[:user_id])
    # Set instance variable @post (assuming you have a Post model)
    @post = @user.posts.find(params[:id])
    # Render the show view
  end
end
