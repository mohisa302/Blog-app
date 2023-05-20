class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = 'Comment created successfully'
    else
      flash[:danger] = "Couldn't create comment"
    end
    redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
