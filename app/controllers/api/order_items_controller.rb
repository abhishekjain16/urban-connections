class Api::OrderItemsController < ApplicationController

  def create
    @order_item = current_order.order_items.build(order_item_params)
    if @order_item.save
      render json: @order_item
    else
      render json: { :errors => @order_item.errors.full_messages }, status: 422
    end
  end

  def index
    @order_items = current_order.order_items
    render json: @order_items
  end

  def update
    @order_item = current_order.order_items.find(params[:id])
    if @order_item.update(order_item_params)
      render json: @order_item      
    else
      render json: { :errors => @order_item.errors.full_messages }, status: 422
    end
  end

  def destroy
    @order_item = current_order.order_items.find(params[:id])
    if @order_item.destroy
      render json: {success: true}
    else
      render json: {success: false}, status: 422
    end
  end

  private

  def current_order
    @current_order = Order.find(params[:order_id])
  end

  def order_item_params
    params.require(:order_item).permit!
  end
end
