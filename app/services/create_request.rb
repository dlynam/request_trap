class CreateRequest

  def initialize(params, request)
    @params = params
    @request = request
    @request_obj = new_request_obj
  end

  def create
    SetRequestInfo.new(request_obj, request).set_info
  end

  private

  attr_reader :request, :params, :request_obj

  def new_request_obj
    Request.new trap_id: params[:trap_id]
  end
end
