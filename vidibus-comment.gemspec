# -*- encoding: utf-8 -*-
$:.unshift File.expand_path('../lib', __FILE__)

require 'vidibus/comment/version'

Gem::Specification.new do |s|
  s.name        = 'vidibus-comment'
  s.version     = Vidibus::Comment::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Martin Jagusch']
  s.email       = ['async@mj.io']
  s.homepage    = 'https://github.com/vidibus/vidibus-comment'
  s.summary     = 'Comments what else.'
  s.description = s.summary

  s.add_dependency 'activesupport', '~> 3.0'
  s.add_dependency 'mongoid', '~> 2.0'
  s.add_dependency 'vidibus-uuid'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rcov'
  s.add_development_dependency 'rdoc'

  s.files = Dir.glob('{lib,app,config}/**/*') + %w[LICENSE README.md Rakefile]
  s.require_path = 'lib'
end
