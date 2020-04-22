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

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update(assignment_params)
    binding.pry
    if @assignment.update(assignment_params)
      redirect_to user_requests_path, notice: 'Success'
    else
      redirect_to user_requests_path, notice: 'Failed'
    end
  end

  def destroy

  end

  private

  def assignment_params
    params.require(:assignment).permit(:volunteer_id)
  end
end
