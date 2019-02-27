# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xmlhasher/version'

Gem::Specification.new do |spec|
  spec.name          = 'xmlhasher_with_attributes'
  spec.version       = XmlHasher::VERSION
  spec.authors       = ['Philippe Blayo']
  spec.description   = %q{Fast XML to Ruby Hash converter}
  spec.summary       = %q{XmlHasher converts XML to Ruby Hash}
  spec.homepage      = 'https://github.com/pblayo/xmlhasher'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version     = '>= 1.8.7'
  spec.required_rubygems_version = '>= 1.3.6'

  spec.add_dependency 'ox', '2.10.0'
  spec.add_dependency 'escape_utils', '1.2.1'

  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "bundler", "~> 1.17"
end
