class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests_near = Request.where(city: current_user.city)
    @requests = Request.all
    @request = Request.new
    map_markers
  end

  def show
    single_map_marker
    @chatroom = Chatroom.includes(messages: :user).where(request: @request).first
  end

  def create
    @request = Request.new(request_params)
    @chatroom = Chatroom.new(name: @request.title, request: @request)
    @request.user = current_user
    if @request.save && @chatroom.save
      redirect_to request_path(@request), notice: "Pedido criado com sucesso"
    else
      redirect_to requests_path
    end
  end

  def edit
  end

  def update
   redirect_to user_requests_path if @request.update(request_params)
  end

  def destroy
    @request.destroy
    redirect_to user_requests_path, notice: "Pedido eliminado com sucesso"
  end

  def favorite
    @request = Request.find(params[:request_id])
    if !current_user.favorited?(@request)
      current_user.favorite(@request)
      redirect_to @request, notice: "O pedido '#{@request.title}' foi adicionado aos teus favoritos"
    else
      current_user.unfavorite(@request)
      redirect_to @request, notice: "O pedido '#{@request.title}' foi removido dos teus favoritos"
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    @request = params.require(:request).permit(:title, :description, :category, :person_name, :age, :address, :zip_code, :city, :phone_number, :volunteer, :completed, photos: [] )
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
