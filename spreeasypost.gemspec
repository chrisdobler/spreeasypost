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
  s.homepage    =
    'http://rubygems.org/gems/spreeasypost'
  s.license       = 'MIT'

  s.add_development_dependency "rspec"

  s.rubyforge_project = "spreeasypost"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
