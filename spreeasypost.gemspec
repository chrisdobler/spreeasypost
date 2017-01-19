# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spreeasypost/version"

Gem::Specification.new do |s|
  s.name        = 'spreeasypost'
  s.version     = Spreeasypost::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = '2016-12-23'
  s.summary     = "Easypost integration for Spree Commerce"
  s.description = "Adds postage purchase options using EasyPost to orders made within Spree Commerce."
  s.authors     = ["Chris Dobler"]
  s.email       = 'chrisdobler@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/spreeasypost'
  s.license       = 'MIT'


  s.add_development_dependency "capybara-screenshot"
  s.add_development_dependency "pry-byebug" # binding.pry to debug!
  s.add_development_dependency "awesome_print"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rails"
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency 'rspec-rails',  '~> 3.5.2'
  s.add_development_dependency 'spring-commands-rspec'
  s.add_development_dependency 'guard-rspec'


  s.add_dependency 'spree_core', '~> 3.1.1'
  s.add_dependency 'easypost', '2.1.7'
  s.add_development_dependency 'spree_sample'
  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'

  s.rubyforge_project = "spreeasypost"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
