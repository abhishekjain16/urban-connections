class Api::BusinessController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show]

  def index
    @businesses = YelpService.search(term, location)
    render json: @businesses
  end

  def show
    @business = YelpService.business(params[:id])
    render json: @business
  end

  def create
    @business = current_user.businesses.build(business_params)
    if @business.save
      render json: @business
    else
      render json: { :errors => @business.errors.full_messages }
    end
  end

  private

  def business_params
    params.require(:business).permit!
  end

  def term
    params[:term] || ""
  end

  def location
    params[:location] || ""
  end
end
