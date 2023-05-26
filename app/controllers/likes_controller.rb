class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like_params = params.require(:like).permit(:post_id)
    @like = current_user.likes.build(like_params.merge(post_id: like_params[:post_id]))

    if @like.save
      flash[:notice] = 'Like created successfully'
    else
      flash[:alert] = 'Like creation failed'
    end

    redirect_to user_post_path(@like.post.author_id, @like.post.id)
  end
end
