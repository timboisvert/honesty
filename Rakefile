require 'rubygems'
require 'rubygems/package_task'
require 'rake/testtask'

PLUGIN = "honesty"
GEM = "honesty"
GEM_VERSION = "3.0.1"
EMAIL = "boisvert@gmail.com"
HOMEPAGE = "http://github.com/timboisvert/honesty"
SUMMARY = "Store and track user activities and system events in a human-readable, easily-searchable format"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false
  s.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = 'Tim Boisvert'
  s.email = EMAIL
  s.homepage = HOMEPAGE

  s.require_path = 'lib'
  s.autorequire = GEM
  s.files = %w(MIT-LICENSE README.rdoc) + Dir.glob("{generators,lib,tasks}/**/*") + %w(init.rb install.rb)
end


Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install the gem"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end

desc "Regenerate gemspec"
task :gemspec do
  File.open("#{GEM}.gemspec", 'w') do |f|
    f.write(spec.to_ruby)
  end
end

desc 'Test the honesty plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end


