class Request < ActiveRecord::Base
  serialize :headers, Hash
  serialize :cookies, Hash
  serialize :query_params, Hash

  default_scope { order('created_at DESC') }

  after_save :notify_monitor

  def self.monitor_new_requests
    begin
      connection.execute "LISTEN request_channel"
      loop do
        connection.raw_connection.wait_for_notify do |event, pid, request_id|
          yield request_id
        end
      end
    ensure
      connection.execute "UNLISTEN request_channel"
    end
  end

  private

  def notify_monitor
    connection.execute "NOTIFY request_channel, #{connection.quote self.id.to_s}"
  end

  def connection
    ActiveRecord::Base.connection
  end

end
