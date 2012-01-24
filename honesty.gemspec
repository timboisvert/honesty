# -*- encoding: utf-8 -*-  
$:.push File.expand_path("../lib", __FILE__)  
require "version"  

Gem::Specification.new do |s|
  s.name = %q{honesty}
  s.version = Honesty::VERSION
  s.authors = ["Tim Boisvert"]
  s.autorequire = %q{honesty}
  s.description = %q{Store and track user activities and system events in a human-readable, easily-searchable format}
  s.email = %q{boisvert@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE"]
  s.files = 
      ["MIT-LICENSE", 
      "README.rdoc", 
      "lib/honesty.rb", 
      "lib/fact.rb", 
      "lib/version.rb", 
      "lib/generators", 
      "lib/generators/honesty", 
      "lib/generators/honesty/honesty_generator.rb", 
      "lib/generators/honesty/templates", 
      "lib/generators/honesty/templates/fact.rb", 
      "lib/generators/honesty/templates/create_facts.rb", 
      "lib/generators/honesty/USAGE", 
      "init.rb", 
      "install.rb"]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/timboisvert/honesty}
  s.require_paths = ["lib"]
  s.summary = %q{Store and track user activities and system events in a human-readable, easily-searchable format}
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
  s.add_dependency "rails"
end
