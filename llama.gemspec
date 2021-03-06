lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'llama/version'

Gem::Specification.new do |spec|
  spec.name          = 'llama'
  spec.version       = Llama::VERSION
  spec.authors       = ['Sergey Ivannikov']
  spec.email         = ['twinfacer@gmail.com']
  spec.summary       = %q{Llama will help you create scaffold project from git repo}
  spec.description   = %q{Llama will help you create scaffold project from git repo}
  spec.homepage      = 'https://github.com/twinfacer/llama'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables << 'llama'

  spec.add_dependency 'thor'
  spec.add_dependency 'colorize'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
