# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zerp/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rob Dodson"]
  gem.email         = ["lets.email.rob@theawesomegmails.com"]
  gem.description   = %q{When a problem comes along..You must zerp it}
  gem.summary       = %q{Now zerp it..Into shape}
  gem.homepage      = "http://robdodson.me"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = ["zerp"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "zerp"
  gem.require_paths = ["lib"]
  gem.version       = Zerp::VERSION
end