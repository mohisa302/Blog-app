module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_user_and_post
      protect_from_forgery with: :null_session

      def index
        @comments = @post.comments
        if @comments.size.positive?
          render json: @comments, status: :ok
        else
          render json: { message: 'No comments found' }, status: :not_found
        end
      end

      def create
        puts "Params: #{params}"
        render json: { message: 'Only the owner of the post can add comments' }, status: :forbidden and return unless @user.id == @post.author_id

        @comment = @post.comments.build(comment_params)
        @comment.author_id = @user.id

        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      private

      def set_user_and_post
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        puts "User: #{@user}, Post: #{@post}"
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
