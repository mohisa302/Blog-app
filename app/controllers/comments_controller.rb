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

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post # Load the associated post object
    respond_to do |format|
      if comment.destroy
        # Successfully deleted the record
        flash[:success] = 'Comment deleted successfully'
      else
        # Failed to delete the record
        flash.now[:error] = 'Error: Comment could not be deleted'
      end
      format.html { redirect_to user_post_path(post.author, post) } # Use the post object to generate the URL
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
