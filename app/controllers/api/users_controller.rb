class Api::UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def logged_in
    render json: current_user
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
    if current_user.update(user_params)
      render json: @user      
    else
      render json: { :errors => current_user.errors.full_messages }
    end
  end

  def destroy
    # @user = User.find(params[:id])
    # if @user.destroy
    #   render json: {success: true}
    # else
    #   render json: {success: false}
    # end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
