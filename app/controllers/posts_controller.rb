class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.includes(:comments, :likes).where(author_id: params[:user_id]).find(params[:id])
    authorize! :read, @post
    @user = User.find(params[:user_id])
    new_comment = Comment.new
    new_like = Like.new
    respond_to do |format|
      format.html { render :show, locals: { new_comment:, new_like: } }
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def destroy
    @user = User.find(params[:user_id]) # current_user
    post = Post.find(params[:id])
    post.comments.destroy_all
    post.likes.destroy_all
    if post.destroy
      flash[:success] = 'Post deleted successfully'
      redirect_to user_posts_path(@user)
    else
      flash.now[:error] = 'Error: Post could not be deleted'
      redirect_to user_post_path(@user, post)
    end
  end
  
  def create
    post_params = params.require(:post).permit(:title, :text)
    @post = current_user.posts.build(post_params)

    respond_to do |_format|
      if @post.save
        flash[:notice] = 'Post created successfully'
        redirect_to users_path
      else
        Rails.logger.error(@post.errors.full_messages)
        flash.now[:alert] = 'Post creation failed'
        render :new, locals: { post: @post }
      end
    end
  end
end
