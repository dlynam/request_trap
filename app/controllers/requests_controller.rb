class RequestsController < ApplicationController

  def create
    CreateRequest.new(params, request, response).create
  end

  def index
  end

  def show
  end

end
