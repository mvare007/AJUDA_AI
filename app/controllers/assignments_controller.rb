class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:update, :destroy]

  def create
    @request = Request.find(params[:request])
    @assignment = Assignment.new(asker: current_user, request: @request)
    if @assignment.save
      redirect_to request_path(@request), notice: 'Enviado com sucesso'
    else
      redirect_to request_path(@request), notice: 'Algo correu mal, tenta outra vez'
    end
  end

  def update
    @assignment.update(assignment_params)
    redirect_to user_requests_path, anchor: @assignment
  end

  def destroy
    @assignment.destroy
    redirect_to user_requests_path
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:volunteer_id)
  end
end
