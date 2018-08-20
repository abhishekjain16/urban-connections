module Api
  module Owner
    class ServicesController < BaseController
      before_action :find_service, only: [:show, :update, :destroy]

      def show
        render json: @service
      end

      def index
        @services = current_business.services
        render json: @services
      end

      def update
        if @service.update(service_params)
          render json: @service    
        else
          render json: { :errors => @service.errors.full_messages }
        end
      end

      def create
        @service = current_business.services.build(service_params)
        if @service.save
          render json: @service
        else
          render json: { :errors => @service.errors.full_messages }
        end
      end

      def destroy
        @service.destroy!
        render json: @service    
      end

      private

      def service_params
        params.require(:service).permit!
      end

      def find_service
        @service = current_business.services.where(id: params[:id]).first
      end
    end
  end
end
