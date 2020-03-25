class AssignmentsController < ApplicationController

  def create
    @request = Request.find(params[:request])
    @assignment = Assignment.new(asker: current_user, request: @request)
    if @assignment.save
      redirect_to request_path(@request), notice: 'Foi enviado o pedido'
    else
      redirect_to request_path(@request), notice: 'Algo correu mal, tenta outra vez'
    end
  end

  def destroy

  end
end
