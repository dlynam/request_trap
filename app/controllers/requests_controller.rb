class RequestsController < ApplicationController
  helper_method :trap_id, :requests

  def create
    CreateRequest.new(trap_id, request, response).create
  end

  def index
  end

  def show
    @request_obj = requests.find params[:id]
  end

  private

  def trap_id
    @trap_id ||= params[:trap_id]
  end

  def requests
    @requests ||= Request.where trap_id: trap_id
  end

end
