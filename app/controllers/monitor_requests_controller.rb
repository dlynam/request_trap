class MonitorRequestsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    begin
      Request.monitor_new_requests do |request_id|
       request_obj = Request.find(request_id)
       html = render_to_string(
         :partial => "requests/request",
         :formats => [:html],
         :locals => { :request_obj => request_obj})
       html.gsub!(/ *\n+/,'')
       response.stream.write "event: update\n"
       response.stream.write "data: #{html}\n\n"
      end
    ensure
     response.stream.close
    end
  end
end
