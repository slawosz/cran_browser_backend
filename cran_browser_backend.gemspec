# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cran_browser_backend/version'

Gem::Specification.new do |gem|
  gem.name          = "cran_browser_backend"
  gem.version       = CranBrowserBackend::VERSION
  gem.authors       = ["Sławosz"]
  gem.email         = ["slawosz@gmail.com"]
  gem.description   = %q{Cran R libraries browser}
  gem.summary       = %q{Cran R libraries browser}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "treetop-dcf"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry"
end
