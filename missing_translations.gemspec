$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "missing_translations/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "missing_translations"
  s.version     = MissingTranslations::VERSION
  s.authors     = ["Enrique Garcia Cota"]
  s.email       = ["kikito@gmail.com"]
  s.homepage    = "http://kikito.github.com"
  s.summary     = "Rails mountable engine that shows missing translations"
  s.description = "Rails mountable engine that shows missing translations"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_development_dependency "sqlite3"
end
