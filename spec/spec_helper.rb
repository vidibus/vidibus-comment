$:.unshift File.join(File.dirname(__FILE__), '..')

require 'rspec'
require 'factory_girl'
require 'active_support'
require 'action_controller'
require 'vidibus-uuid'

require 'vidibus-comment'

require 'app/models/comment'
require 'app/controllers/comments_controller'
require 'support/models'
require 'factories'

Mongoid.configure do |config|
  name = 'vidibus-comment_test'
  host = 'localhost'
  config.master = Mongo::Connection.new.db(name)
end

RSpec.configure do |config|
  config.before(:each) do
    Mongoid.master.collections.select {|c| c.name !~ /system/}.each(&:drop)
  end
end
