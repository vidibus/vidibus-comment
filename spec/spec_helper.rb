$:.unshift File.expand_path('../../app', __FILE__)

require 'rspec'
require 'vidibus-uuid'

require 'vidibus-comment'
require 'models/comment'
require 'support/models'

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
