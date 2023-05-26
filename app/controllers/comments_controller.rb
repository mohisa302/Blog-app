class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    puts "@post: #{@post.inspect}"
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to user_post_path(@post.author, @post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
