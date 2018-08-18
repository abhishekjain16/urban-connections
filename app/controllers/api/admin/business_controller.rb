module Api
  module Admin
    class BusinessController < BaseController

      def index
        @business = Business.all
        render json: @business
      end

      def update
        @business = Business.where(id: params[:id]).first
        if @business.update(business_params)
          render json: @business
        else
          render json: { :errors => @business.errors.full_messages }
        end
      end

      def show
        @business = Business.where(id: params[:id]).first
        render json: @business
      end

      def create
        @business = Business.new(business_params)
        if @business.save
          render json: @business
        else
          render json: { :errors => @business.errors.full_messages }
        end
      end

      def destroy
        @business = Business.where(id: params[:id]).first
        @business.update!(status: false)
        render json: @business
      end

      private

      def business_params
        params.require(:business).permit!
      end

    end
  end
end
