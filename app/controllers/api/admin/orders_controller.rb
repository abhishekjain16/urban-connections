module Api
  module Admin
    class OrdersController < BaseController

      def index
        @orders = current_business.orders
        render json: @orders
      end

      def update
        @order = current_business.orders.where(id: params[:id]).first
        if @order.update(order_params)
          render json: @order
        else
          render json: { :errors => @order.errors.full_messages }
        end
      end

      def show
        @order = current_business.orders.where(id: params[:id]).first
        render json: @order
      end

      def create
        @order = order.new(order_params)
        if @order.save
          render json: @order
        else
          render json: { :errors => @order.errors.full_messages }
        end
      end

      def destroy
        @order = current_business.orders.where(id: params[:id]).first
        @order.update!(status: false)
        render json: @order
      end

      private

      def order_params
        params.require(:order).permit!
      end

    end
  end
end
