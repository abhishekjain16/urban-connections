class Api::Staff::BaseController < ApplicationController
  before_action :verify_staff

  private

  def verify_staff
    unless current_user.staff?
      render json: { error: "You are not authorized", status: 403 }
    end
  end
end
