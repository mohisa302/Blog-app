module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_user
      before_action :set_post, only: [:comments, :add_comment]

      def index
        @posts = Post.all
        render json: @posts
      end

      private
      def set_user
        @user = User.find(params[:user_id])
      end

      def set_post
        @post = @user.posts.find(params[:id])
      end

    end
  end
end
