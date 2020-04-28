class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to user_requests_path
    else
      redirect_to user_requests_path, notice: "Oops! Houve um erro, volta a tentar."
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :request_id, :user_id)
  end
end
