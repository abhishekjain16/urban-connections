class Api::OrdersController < ApplicationController

  def show
    @order = current_business.orders.find(params[:id])
    render json: @order
  end

  def create
    @order = current_business.orders.build(order_params)
    if @order.save
      render json: @order
    else
      render json: { :errors => @order.errors.full_messages }, status: 422
    end
  end

  def all
    @orders = current_user.orders
    render json: @orders
  end

  def index
    @orders = current_business.orders
    render json: @orders
  end

  def update
    @order = current_business.orders.find(params[:id])
    if @order.update(order_params)
      render json: @order      
    else
      render json: { :errors => @order.errors.full_messages }, status: 422
    end
  end

  def last
    @order = current_business.orders.where(customer_id: current_user.id)
    if params[:status].present?
      @order = @order.where(status: params[:state])
    end
    @order = @order.last
    render json: @order
  end

  def destroy
    @order = current_business.orders.find(params[:id])
    if @order.reject!
      render json: {success: true}
    else
      render json: {success: false}, status: 422
    end
  end

  private

  def current_business
    @current_business = Business.find(params[:business_id])
  end

  def order_params
    params.require(:order).permit!
  end
end
