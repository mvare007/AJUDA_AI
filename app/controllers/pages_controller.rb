class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @requests_near = Request.where(city: current_user.city)
    @request_user = RequestUser.where(user: current_user)
    @requests = Request.geocoded
    @markers = @requests.map do |request|
      {
        lat: request.latitude,
        lng: request.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { request: request })
      }
    end
  end
end
