class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_requests = Request.where(user: @user)
    @sender_assignments = Assignment.where(sender: @user)
    @receiver_assignments = Assignment.where(receiver: @user)
    mean_rating
  end

  private

  def mean_rating
    @mean_rating = []
    @user.reviews.each do |review|
      @mean_rating << review.rating
    end
    @mean = @mean_rating.sum * @user.reviews.count
  end
end
