module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_user
      before_action :set_post, only: [:comments, :add_comment]

      def index
        @posts = Post.all
        render json: @posts
      end
      
      def comments
        @comments = @post.comments
        render json: @comments
      end

      def add_comment
        @comment = @post.comments.build(comment_params)
        @comment.author_id = @user.id

        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_post
        @post = @user.posts.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
