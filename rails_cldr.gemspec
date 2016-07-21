$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_cldr/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_cldr"
  s.version     = RailsCldr::VERSION
  s.authors     = ["Roman Simecek"]
  s.email       = ["roman@good2go.ch"]
  s.homepage    = "http://github.com/raskhadafi"
  s.summary     = "Serve cldr data for a rails application."
  s.description = "This engines serves and loads the required json data for cldr."
  s.license     = "MIT"

  s.files       = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files  = Dir["test/**/*"]

  s.add_runtime_dependency     "rails", "~> 4.2.6"
  s.add_runtime_dependency     "js-routes"

  s.add_development_dependency "sqlite3"
end
