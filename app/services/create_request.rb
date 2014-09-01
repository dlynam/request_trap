class CreateRequest

  def initialize(params, request, response)
    @params = params
    @request = request
    @response = response
    @request_obj = new_request_obj
  end

  def create
    SetRequestInfo.new(request_obj, request).set_info
    request_obj.raw_response = response.body
    request_obj.save
  end

  private

  attr_reader :request, :params, :response, :request_obj

  def new_request_obj
    Request.new trap_id: params[:trap_id]
  end
end
