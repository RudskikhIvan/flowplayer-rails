$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "flowplayer-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "flowplayer-rails"
  s.version     = FlowplayerRails::VERSION
  s.authors     = ["Rudskich Ivan"]
  s.email       = ["shredder-rull@yandex.ru"]
  s.homepage    = "http://github.com/shredder/flowplayer-rails"
  s.summary     = "FlowplayerRails"
  s.description = "FlowplayerRails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rake"
  s.add_development_dependency "pry"
end
