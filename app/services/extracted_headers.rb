class ExtractedHeaders

  def initialize(headers_obj)
    @headers_obj = headers_obj
    @extracted_headers = {}
  end

  def extract
    extracted_headers['REQUEST_METHOD'] = headers_obj['REQUEST_METHOD']
    extracted_headers['REQUEST_URI'] = headers_obj['REQUEST_URI']
    extracted_headers['SERVER_PROTOCOL'] = headers_obj['SERVER_PROTOCOL']
    extracted_headers['HOST'] = headers_obj['HTTP_HOST']
    extracted_headers['USER_AGENT'] = headers_obj['HTTP_USER_AGENT']
    extracted_headers['ACCEPT'] = headers_obj['HTTP_ACCEPT']
    extracted_headers['ACCEPT_LANGUAGE'] = headers_obj['HTTP_ACCEPT_LANGUAGE']
    extracted_headers['ACCEPT_ENCODING'] = headers_obj['HTTP_ACCEPT_ENCODING']
    extracted_headers['CONNECTION'] = headers_obj['HTTP_CONNECTION']
    extracted_headers['CONTENT_TYPE'] = headers_obj['Content-Type']
    return extracted_headers
  end

  private

  attr_reader :headers_obj, :extracted_headers
end
