class Api::Admin::BaseController < ApplicationController
  before_action :verify_admin

  private

  def verify_admin
    unless current_user.admin?
      render json: { error: "You are not authorized", status: 403 }
    end
  end

  def current_business
    @current_business ||= Business.where(id: params[:business_id]).first
  end

end
