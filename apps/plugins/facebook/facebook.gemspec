$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "facebook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "facebook"
  s.version     = Facebook::VERSION
  s.authors     = ["Denis Borodai"]
  s.email       = ["den4ik@quartsoft.com"]
  s.homepage    = ""
  s.summary     = ": Summary of Facebook."
  s.description = ": Description of Facebook."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
  s.add_dependency "omniauth-facebook"
end
