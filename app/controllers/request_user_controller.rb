class RequestUserController < ApplicationController
  def create
    @request_user = RequestUser.new
    @request = Request.find(params[:request])
    @request_user.request = @request
    @request_user.user = current_user
    if @request_user.save
      redirect_to request_path(@request), notice: "Aceitaste este pedido"
    else
      redirect_to request_path(@request), notice: "Houve um problema, volta a tentar"
    end
  end
end
