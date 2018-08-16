class Api::OrdersController < ApplicationController

  def show
    @order = current_order.orders.find(params[:id])
    render json: @order
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      render json: @order
    else
      render json: { :errors => @order.errors.full_messages }
    end
  end

  def update
    @order = current_order.orders.find(params[:id])
    if @order.update(order_params)
      render json: @order      
    else
      render json: { :errors => @order.errors.full_messages }
    end
  end

  def destroy
    @order = current_order.orders.find(params[:id])
    if @order.destroy
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

  private

  def order_params
    params.require(:order).permit!
  end
end
