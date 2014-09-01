class SetRequestInfo

  def initialize(request_obj, request)
    @request_obj = request_obj
    @request = request
  end

  def set_info
    set_scheme
  end

  private

  attr_reader :request, :request_obj
end
