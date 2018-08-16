module Api
  module Owner
    class BusinessController < BaseController
      def update
        @business = current_user.businesses.where(id: params[:id]).first
        if @business.update(business_params)
          render json: @business
        else
          render json: { :errors => @business.errors.full_messages }
        end
      end

      def show
        @business = current_user.businesses.where(id: params[:id]).first
        render json: @business
      end

      def index
        @business = current_user.businesses
        render json: @business
      end

      private

      def business_params
        params.require(:business).permit!
      end

    end
  end
end
