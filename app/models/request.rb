class Request < ActiveRecord::Base
  serialize :headers, Hash
  serialize :cookies, Hash
  serialize :query_params, Hash

  default_scope { order('created_at DESC') }

  after_save :notify_monitor

  def self.monitor_new_requests(trap_id)
    begin
      connection.execute "LISTEN #{trap_id}_channel"
      loop do
        connection.raw_connection.wait_for_notify do |event, pid, request_id|
          yield request_id
        end
      end
    ensure
      connection.execute "UNLISTEN #{trap_id}_channel"
    end
  end

  def self.channel(trap_id)
    "#{trap_id}_channel"
  end

  private

  def notify_monitor
    connection.execute "NOTIFY #{channel}, #{connection.quote self.id.to_s}"
  end

  def connection
    ActiveRecord::Base.connection
  end

  def channel
    "#{trap_id}_channel"
  end

end
