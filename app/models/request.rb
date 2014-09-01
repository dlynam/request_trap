class Request < ActiveRecord::Base
  serialize :headers, Hash
  serialize :cookies, Hash
  serialize :query_params, Hash

  default_scope { order('created_at DESC') }
end
