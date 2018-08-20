module Api
  module Staff
    class OrdersController < BaseController
      before_action :find_order, only: [:show, :update, :destroy]

      def show
        render json: @order
      end

      def index
        @orders = current_user.orders
        render json: @orders
      end

      def update
        if @order.update(order_params)
          render json: @order    
        else
          render json: { :errors => @order.errors.full_messages }
        end
      end

      private

      def order_params
        params.require(:order).permit!
      end

      def find_order
        @order = current_user.orders.where(id: params[:id]).first
      end
    end
  end
end
