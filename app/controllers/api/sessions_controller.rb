class Api::SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render json: {token: @user.access_token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def destroy
    current_user.regenerate_access_token
    render json: { success: true }
  end
end
