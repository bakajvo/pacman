
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pacman/version'

Gem::Specification.new do |spec|
  spec.name          = 'pacman'
  spec.version       = Pacman::VERSION
  spec.authors       = ['Vojtech Bakaj']
  spec.email         = ['bakajvo1@fit.cvut.cz']

  spec.summary       = 'Pacman'
  spec.description   = 'Pacman game'
  spec.homepage      = 'http://bakaj.cz/'
  spec.license       = 'MIT'

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'gosu', '~> 0.13.2'
end
