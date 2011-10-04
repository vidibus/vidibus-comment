require 'active_support'
require 'mongoid'

require 'vidibus/comment'

if defined?(Rails)
  module Vidibus::Comment
    class Engine < ::Rails::Engine; end
  end
end
