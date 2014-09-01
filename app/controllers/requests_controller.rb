class RequestsController < ApplicationController
  helper_method :trap_id

  def create
    CreateRequest.new(trap_id, request, response).create
  end

  def index
    @requests = Request.where trap_id: trap_id
  end

  def show
  end

  private

  def trap_id
    @trap_id ||= params[:trap_id]
  end

end
