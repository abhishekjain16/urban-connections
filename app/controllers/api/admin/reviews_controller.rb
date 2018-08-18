module Api
  module Admin
    class ReviewsController < BaseController

      def index
        @reviews = current_business.reviews
        render json: @reviews
      end

      def update
        @review = current_business.reviews.where(id: params[:id]).first
        if @review.update(review_params)
          render json: @review
        else
          render json: { :errors => @review.errors.full_messages }
        end
      end

      def show
        @review = current_business.reviews.where(id: params[:id]).first
        render json: @review
      end

      def create
        @review = review.new(review_params)
        if @review.save
          render json: @review
        else
          render json: { :errors => @review.errors.full_messages }
        end
      end

      def destroy
        @review = current_business.reviews.where(id: params[:id]).first
        @review.destroy
        render json: {success: true}
      end

      private

      def review_params
        params.require(:review).permit!
      end

    end
  end
end
