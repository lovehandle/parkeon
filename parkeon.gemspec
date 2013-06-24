# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parkeon/version'

Gem::Specification.new do |spec|
  spec.name          = "parkeon"
  spec.version       = Parkeon::VERSION
  spec.authors       = ["Ryan Closner"]
  spec.email         = ["ryan@ryanclosner.com"]
  spec.description   = %q{A Ruby wrapper to access the Parkeon parking meter API}
  spec.summary       = %q{A Ruby wrapper to access the Parkeon parking meter API}
  spec.homepage      = "https://github.com/rclosner/parkeon"
  spec.license       = "MIT"

  runtime_dependencies = {
    "nokogiri" => "~> 1.6.0",
    "virtus"   => "~> 0.5.5"
  }

  runtime_dependencies.each {|lib, version| spec.add_runtime_dependency lib, version }

  development_dependencies = {
    "bundler" => "~> 1.3.5",
    "rake"    => "~> 10.0.4"
  }

  development_dependencies.each {|lib, version| spec.add_development_dependency lib, version }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
