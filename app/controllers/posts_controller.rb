class PostsController < ApplicationController
  def index
    # Set instance variable @user (assuming you have a User model)
    @user = User.find(params[:user_id])
    # Set instance variable @posts (assuming you have a Post model)
    @posts = @user.posts
    # Render the index view
  end
  
  def show
    @comments = Comment.where(post_id: params[:id])
    # Set instance variable @user (assuming you have a User model)
    @post = Post.find(params[:id])
    @user = @post.author
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash[:danger] = "Couldn't create post"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
