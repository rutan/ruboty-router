# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/router/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-router'
  spec.version       = Ruboty::Router::VERSION
  spec.authors       = ['ru_shalm']
  spec.email         = ['ru_shalm@hazimu.com']

  spec.summary       = 'Mount http router to Ruboty. (like hubot.router)'
  spec.homepage      = 'https://github.com/rutan/ruboty-router'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'ruboty'
  spec.add_dependency 'rack'
  spec.add_dependency 'pendragon'
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
end
