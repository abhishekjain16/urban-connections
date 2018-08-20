class Api::BusinessController < ApplicationController
  skip_before_action :authenticate

  def index
    @businesses = YelpService.search(term, location)
    render json: @businesses
  end

  def show
    @business = YelpService.business(params[:id])
    render json: @business
  end

  def reviews
    @reviews = YelpService.reviews(params[:id])
    render json: @reviews
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      render json: @business
    else
      render json: { :errors => @business.errors.full_messages }
    end
  end

  def yelp
    @business = Business.find_by(yelp_id: params[:id])
    render json: @business
  end

  def owner
    @business = Business.find(params[:id])
    render json: @business.owner
  end

  def my_business
    @business = Business.find(params[:id])
    render json: @business
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
