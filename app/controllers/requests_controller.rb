class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update]

  def index
    @requests_near = Request.where(city: current_user.city)
    @requests = Request.all
    map_markers
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
      redirect_to request_path(@request), notice: "O teu pedido foi criado"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @volunteer = User.find(params[:user])
    @request.update(volunteer_id: @volunteer.id)
    if @request.save
      redirect_to request_path(@request), notice: 'Okkkkkkkkkkkkkkkkkkkkkkkkkkkk'
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
    @request = params.require(:request).permit(:title, :description, :category, :person_name, :age, :address, :zip_code, :city, :phone_number, :volunteer_id, :user)
  end

  def map_markers
    @requests_geo = Request.geocoded
    @markers = @requests_geo.map do |request|
      {
        lat: request.latitude,
        lng: request.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { request: request })
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
