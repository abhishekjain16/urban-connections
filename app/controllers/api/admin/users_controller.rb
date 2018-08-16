module Api
  module Admin
    class Api::UsersController < ApplicationController
      skip_before_action :authenticate, only: [:create]

      def show
        @user = User.find(params[:id])
        render json: @user
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user
        else
          render json: { :errors => @user.errors.full_messages }
        end
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: @user      
        else
          render json: { :errors => @user.errors.full_messages }
        end
      end

      def index
        @users = User.all
        render json: @users
      end

      def destroy
        @user = User.find(params[:id])
        if @user.update(status: false)
          render json: {success: true}
        else
          render json: {success: false}
        end
      end

      private

      def user_params
        params.require(:user).permit!
      end
    end
  end
end

