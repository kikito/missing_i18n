$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "missing_i18n/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "missing_i18n"
  s.version     = MissingI18n::VERSION
  s.authors     = ["Enrique Garcia Cota"]
  s.email       = ["kikito@gmail.com"]
  s.homepage    = "http://kikito.github.com"
  s.summary     = "Find missing i18n translations"
  s.description = "Rails mountable engine that finds missing i18n translations and displays them in a variety of formats."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,script,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_development_dependency "sqlite3"
end
