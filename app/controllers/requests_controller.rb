class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit]

  def index
    @requests_near = Request.where(city: current_user.city)
    @requests = Request.where.not(city: current_user.city)
    @requests = Request.geocoded
    @markers = @requests.map do |request|
      {
        lat: request.latitude,
        lng: request.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { request: request })
      }
    end
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
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
end
