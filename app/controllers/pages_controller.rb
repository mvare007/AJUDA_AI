class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def requests
    @requests = current_user.requests
    @new_request = Request.new
    @review = Review.new
  end

  def search
    if params[:query].present?
      @requests = Request.search_by_title_and_city(params[:query])
      @users = User.search_by_first_name_last_name_and_cityme_last_name_and_city(params[:query])
    end
  end

  private

  def map(requests)
    @markers = requests.map do |request|
      {
        lat: request.latitude,
        lng: request.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { request: request })
      }
    end
  end

end

