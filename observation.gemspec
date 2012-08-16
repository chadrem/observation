# -*- encoding: utf-8 -*-
require File.expand_path('../lib/observation/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chad Remesch"]
  gem.email         = ["chad@remesch.com"]
  gem.description   = %q{Add an event system to any Ruby class.}
  gem.summary       = %q{Observation lets you add a simple event system to any Ruby class. Use it to decrease coupling between your objects.}
  gem.homepage      = "https://github.com/chadrem/observation"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "observation"
  gem.require_paths = ["lib"]
  gem.version       = Observation::VERSION
end
