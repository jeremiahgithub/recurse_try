$:.push File.expand_path("../lib", __FILE__)
require "recurse_try/version"

Gem::Specification.new do |s|
  s.name = %q{recurse_try}
  s.version = RecurseTry.version
  s.date = %q{2019-06-22}
  s.summary = %q{lets try over and over and over again}
  s.summary = "Plugin to try over and over and over again."
 s.description = """
 This is improved version of ruby's try method.
 """
  s.licenses = [%q{MIT}]
  s.email = %q{jeremiahinc@gmail.com}
  s.authors = ["The Bowen"]
  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.require_paths = ["lib"]
end
