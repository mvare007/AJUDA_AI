class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit]

  def index
    @requests_near = Request.where(city: current_user.city)
    @requests_far = Request.where.not(city: current_user.city).geocoded
    @requests = Request.geocoded
    map_markers(@requests)
  end

  def show
    single_map_marker
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to request_path(@request)
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    @request = params.require(:request).permit(:title, :description, :category, :person_name, :age, :address, :zip_code, :city, :phone_number)
  end

  def map_markers(marker)
    @markers = marker.map do |marker|
      {
        lat: marker.latitude,
        lng: marker.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { request: marker })
      }
    end
  end

  def single_map_marker
    @markers = [
      {
        lat: @request.latitude,
        lng: @request.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { request: @request })
      }]
  end
end
