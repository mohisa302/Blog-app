module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user

      def index
        render json: @user.posts
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
