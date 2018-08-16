class Api::Owner::BaseController < ApplicationController
  before_action :verify_owner

  private

  def verify_owner
    unless current_user.owner?
      render json: { error: "You are not authorized", status: 403 }
    end
  end

  def current_business
    @current_business ||= current_user.businesses.where(id: params[:business_id]).first
  end
end
