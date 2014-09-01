class RequestsController < ApplicationController

  def create
    CreateRequest.new(trap_id, request, response).create
  end

  def index
    raise trap_id.inspect
    raise params.inspect
  end

  def show
  end

  private

  def trap_id
    @trap_id ||= params[:trap_id]
  end

end
