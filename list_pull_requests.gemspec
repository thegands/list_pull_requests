# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'list_pull_requests/version'

Gem::Specification.new do |spec|
  spec.name          = "list-pull-requests"
  spec.version       = ListPullRequests::VERSION
  spec.authors       = ["thegands"]
  spec.email         = ["thegands@gmail.com"]

  spec.summary       = %q{List the pull requests for a user on GitHub}
  spec.homepage      = "https://github.com/thegands/list_pull_requests"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["list-pull-requests"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "colorize"
end
