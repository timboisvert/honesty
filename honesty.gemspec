# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "honesty/version"

Gem::Specification.new do |s|
  s.name        = "honesty"
  s.version     = Honesty::VERSION
  s.authors     = ["Tim Boisvert"]
  s.email       = ["boisvert@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Store and track human-readable user activities and system events}
  s.description = %q{Store and track user activities and system events in a human-readable, easily-searchable format.}

  s.rubyforge_project = "honesty"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'sqlite3'
  s.add_dependency 'rails', '~> 3.0'
end
