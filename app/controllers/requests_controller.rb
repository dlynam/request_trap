class RequestsController < ApplicationController

  def create
    CreateRequest.new(params, request).create
  end

  def index
  end

  def show
  end

end
