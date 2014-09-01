class CreateRequest

  def initialize(trap_id, request, response)
    @request = request
    @response = response
    @request_obj = new_request_obj(trap_id)
  end

  def create
    SetRequestInfo.new(request_obj, request).set_info
    request_obj.raw_response = response.body
    request_obj.save
  end

  private

  attr_reader :request, :response, :request_obj

  def new_request_obj(trap_id)
    Request.new trap_id: trap_id
  end
end
