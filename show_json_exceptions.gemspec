# -*- encoding: utf-8 -*-
require File.expand_path('../lib/show_json_exceptions/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matthew Savage"]
  gem.email         = ["matt@amasses.net"]
  gem.description   = %q{Changes the default rails 'exception' behavior to render JSON instead of a HTML view (e.g. 404, 500 errors etc)}
  gem.homepage      = "https://github.com/amasses/show_json_exceptions"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "show_json_exceptions"
  gem.require_paths = ["lib"]
  gem.version       = ShowJsonExceptions::VERSION

  gem.add_dependency "rails"
  gem.add_dependency "multi_json"
end
