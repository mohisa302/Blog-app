class UsersController < ApplicationController
  def index
    # Set instance variable @users (assuming you have a User model)
    @users = User.all
    @current_user = current_user
    # Render the index view
  end

  def show
    # Set instance variable @user (assuming you have a User model)
    @user = User.find(params[:id])
    # Set instance variable @posts (assuming you have a Post model)
    @posts = @user.recent_posts
    # Render the show view
  end
end
