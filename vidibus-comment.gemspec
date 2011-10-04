# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'vidibus/comment/version'

Gem::Specification.new do |s|
  s.name        = 'vidibus-comment'
  s.version     = Vidibus::Comment::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'TODO: Your Name'
  s.email       = 'TODO your.name@vidibus.com'
  s.homepage    = 'https://github.com/vidibus/vidibus-comment'
  s.summary     = 'TODO: Write a gem summary'
  s.description = 'TODO: Write a gem description'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'vidibus-comment'

  s.add_dependency 'mongoid', '~> 2'

  s.add_development_dependency 'bundler', '>= 1.0.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rcov'
  s.add_development_dependency 'rspec', '~> 2'
  s.add_development_dependency 'rr'

  s.files = Dir.glob('{lib,app,config}/**/*') + %w[LICENSE README.md Rakefile]
  s.require_path = 'lib'
end