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
    @assignment = @request.assignments.where(asker: current_user).first
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @volunteer = Volunteer.new(request: @request)
    @request.user = current_user
    if @request.save && @volunteer.save || verify_recaptcha(model: @request)
      create_pictures
      redirect_to request_path(@request), notice: "Pedido criado com sucesso"
    else
      render :new, notice: "Corrige os erros e tenta novamente"
    end
  end

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to user_requests_path(anchor: "request-#{request[:id]}")
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to user_requests_path, notice: "Pedido eliminado com sucesso"
  end

  def favorite
    @request = Request.find(params[:request_id])
    if !current_user.favorited?(@request)
      current_user.favorite(@request)
      redirect_to @request, notice: "O pedido '#{@request.title}' foi guardado na tua lista"
    else
      current_user.unfavorite(@request)
      redirect_to @request, notice: "O pedido '#{@request.title}' foi removido da tua lista"
    end
  end

  def category
    @requests = Request.where(category: params[:category])
    @other_requests = Request.all.sample(10)
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    @request = params.require(:request).permit(:title, :description, :category, :person_name, :age, :address, :zip_code, :city, :phone_number, :volunteer, :completed )
  end

  def create_pictures
    photos = params.dig(:request, :pictures) || []
    photos.each do |photo|
      @request.pictures.create!(photo: photo)
    end
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
