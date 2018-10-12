class ReviewsController < ApplicationController

  before_filter :authorize


  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    # after @review has been initialized, but before calling .save on it:
    @review.user = current_user
    @review.save
    redirect_to @product
  end

  def destroy
    puts "destroy method"
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to @product
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
