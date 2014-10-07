$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "app_stats/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "app_stats"
  s.version     = AppStats::VERSION
  s.authors     = ["Paul Cox"]
  s.email       = ["paulcox24@gmail.com"]
  s.homepage    = "https://github.com/paulcox24"
  s.summary     = "AppStats -- Get some stats on your rails app"
  s.description = "Uses some shell commands and pipe to get stats on your code."
  s.license     = "MIT"

  s.files       = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files  = Dir["test/**/*"]
  s.bindir      =  'bin'

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "3.1.0"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry-nav"
end
