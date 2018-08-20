class Api::SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: {error: "Invalid username or password"}, status: 403
    end
  end

  def destroy
    current_user.regenerate_access_token
    render json: { success: true }
  end
end
