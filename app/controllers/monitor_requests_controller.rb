class MonitorRequestsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    begin
      Request.monitor_new_requests do |request_id|
       response.stream.write "event: update\n"
       response.stream.write "data: #{request_html(request_id)}\n\n"
      end
    ensure
     response.stream.close
    end
  end

  private

  def request_html(request_id)
    request_obj = Request.find(request_id)
    html = render_to_string(
      :partial => "requests/request",
      :formats => [ :html ],
      :locals => { :request_obj => request_obj})
    html.gsub(/ *\n+/,'')
  end
end
