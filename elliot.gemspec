# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elliot/version'

Gem::Specification.new do |spec|
  spec.name          = 'elliot'
  spec.version       = Elliot::VERSION
  spec.authors       = ['Ethan Turkeltaub']
  spec.email         = ['ethan.turkeltaub@gmail.com']

  spec.summary       = %q{Authentication for Hanami with Warden.}
  spec.description   = %q{Authentication for Hanami with Warden.}
  spec.homepage      = 'https://github.com/eturk/elliot'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'bcrypt', '~> 3.1'

  spec.add_development_dependency 'bundler', '~> 1.11'
end
