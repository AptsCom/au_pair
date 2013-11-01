# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'au_pair/version'

Gem::Specification.new do |spec|
  spec.name          = "au_pair"
  spec.version       = AuPair::VERSION
  spec.authors       = ["Corey Ehmke"]
  spec.email         = ["cehmke@apartments.com"]
  spec.description   = %q{AuPair provides token-based authentication and versioning for Rails API applications.}
  spec.summary       = %q{API versioning and token authentication}
  spec.homepage      = "https://github.com/aptsCom/au_pair"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
