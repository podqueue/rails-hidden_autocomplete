$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rails/hidden_autocomplete/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "rails-hidden_autocomplete"
  spec.version     = Rails::HiddenAutocomplete::VERSION
  spec.authors     = ["Ryan Baumann"]
  spec.email       = ["ryan@podqueue.fm"]
  spec.homepage    = "https://github.com/podqueue/rails-hidden_autocomplete"
  spec.summary     = "Adds autocomplete=\"off\" to all hidden inputs generated by Rails"
  spec.description = "rails-hidden_autocomplete is a Rails-modifying Rails Engine to inject the autocomplete=\"off\" attribute into all hidden form inputs generated by Rails. This is necessary because Firefox will randomly overwrite the values of hidden inputs without an autocomplete=\"off\" attribute."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "gem-release"
end
