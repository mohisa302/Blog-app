class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.includes(:comments, :likes).where(author_id: params[:user_id]).find(params[:id])
    @user = User.find(params[:user_id])
    new_comment = Comment.new
    new_like = Like.new
    respond_to do |format|
      format.html { render :show, locals: { new_comment: new_comment, new_like: new_like } }
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    post_params = params.require(:post).permit(:title, :text)
    @post = current_user.posts.build(post_params)

    respond_to do |format|
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
