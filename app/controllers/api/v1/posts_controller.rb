class Api::V1::PostsController < ApiController
  def index
    @user = User.find(params[:user_id])
  end
end
