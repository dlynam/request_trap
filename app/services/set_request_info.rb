class SetRequestInfo

  def initialize(request_obj, request)
    @request_obj = request_obj
    @request = request
  end

  def set_info
    set_remote_ip
    set_request_method
    set_scheme
    set_query_string
    set_query_parameters
    set_cookies
    set_headers
  end

  def set_remote_ip
    request_obj.remote_ip = request.remote_ip
  end

  def set_request_method
    request_obj.method = request.method
  end

  def set_scheme
    request_obj.scheme = request.scheme
  end

  def set_query_string
    request_obj.query_string = request.query_string
  end

  def set_query_parameters
    request_obj.query_params = request.parameters
  end

  def set_cookies
    request_obj.cookies = request.cookies
  end

  def set_headers
    request_obj.headers = ExtractedHeaders.new(request.headers).extract
  end

  private

  attr_reader :request, :request_obj
end
