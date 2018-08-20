class Api::ServicesController < ApplicationController

  def index
    @services = current_business.services
    render json: @services
  end

  private

  def current_business
    @current_business = Business.find(params[:business_id])
  end
end
