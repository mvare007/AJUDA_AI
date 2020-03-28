class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_requests = Request.where(user: @user)
    @sender_assignments = Assignment.where(sender: @user)
    @receiver_assignments = Assignment.where(receiver: @user)
    mean_rating
  end

  def follow
    @user = User.find(params[:user_id])
    if !current_user.favorited?(@user, scope: :follow)
      current_user.favorite(@user, scope: :follow)
      redirect_to @user, notice: "Agora segues #{@user.full_name}"
    else
      current_user.unfavorite(@user, scope: :follow)
      redirect_to @user, notice: "Deixaste de seguir #{@user.full_name}"
    end
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
