require 'rspec'
require 'rr'
require 'vidibus-comment'

require 'support/stubs'
require 'support/models'

Mongoid.configure do |config|
  name = 'vidibus-comment_test'
  host = 'localhost'
  config.master = Mongo::Connection.new.db(name)
  # Display MongoDB logs for debugging:
  # config.master = Mongo::Connection.new("localhost", 27017, :logger => Logger.new($stdout, :info)).db(name)
  config.logger = nil
end

RSpec.configure do |config|
  config.mock_with :rr
  config.before(:each) do
    Mongoid.master.collections.select {|c| c.name !~ /system/}.each(&:drop)
  end
end
