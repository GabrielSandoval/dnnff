$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dnnff/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dnnff"
  s.version     = Dnnff::VERSION
  s.authors     = ["Gabriel Sandoval"]
  s.email       = ["gabriel@aelogica.com"]
  s.homepage    = "http://github.com/gabrielsandoval/dnnff"
  s.summary     = "Loads weights and biases json and performs feed forward propagation."
  s.description = "Loads weights and biases json and performs feed forward propagation."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.7"

  s.add_development_dependency "sqlite3"
end
