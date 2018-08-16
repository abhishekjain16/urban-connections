class Api::BusinessController < ApplicationController

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
end
