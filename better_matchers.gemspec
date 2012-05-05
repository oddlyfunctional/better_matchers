# -*- encoding: utf-8 -*-
require File.expand_path('../lib/better_matchers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["mrodrigues"]
  gem.email         = ["mrodrigues.uff@gmail.com"]
  gem.description   = %q{Some matchers for more semantic tests.}
  gem.summary       = %q{Some matchers for more semantic tests.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "better_matchers"
  gem.require_paths = ["lib"]
  gem.version       = BetterMatchers::VERSION
  
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "activerecord"
end
