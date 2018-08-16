module Api
  module Owner
    class StaffsController < BaseController
      before_action :find_staff, only: [:show, :update, :destroy]

      def show
        render json: @staff
      end

      def create
        @staff = current_business.staffs.build(staff_params)
        if staff.save
          render json: @staff    
        else
          render json: { :errors => @staff.errors.full_messages }
        end
      end

      def index
        @staffs = current_business.staffs
        render json: @staffs
      end

      def update
        if @staff.update(staff_params)
          render json: @staff    
        else
          render json: { :errors => @staff.errors.full_messages }
        end
      end

      def destroy
        @staff.update(status: false)
        render json: @staff    
      end

      private

      def staff_params
        params.require(:staff).permit!
      end

      def find_staff
        @staff = current_business.staffs.where(id: params[:id]).first
      end
    end
  end
end
