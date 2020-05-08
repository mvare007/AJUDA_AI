class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_requests = Request.where(user: @user)
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
end
