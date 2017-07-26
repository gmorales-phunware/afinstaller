# coding: utf-8
# lib = File.expand_path("../lib", __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require "afinstaller/version"
require File.expand_path("../lib/afinstaller/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "afinstaller"
  spec.version       = Afinstaller::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Gabe Morales"]
  spec.email         = ["gmorales@phunware.com"]

  spec.summary       = %q{PW's AF iOS and Android Command Line Tool.}
  spec.description   = %q{Simple Ruby gem to install and build Out of the Box iOS or Android AF projects.}
  spec.homepage      = "https://rubygems.org/gems/afinstaller"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"

  spec.add_dependency "thor"
  spec.add_dependency "cocoapods"
  spec.add_runtime_dependency "xcpretty"
  spec.add_dependency "rainbow", ">= 0"

  spec.files        = `git ls-files`.split("\n")
  spec.executables   << 'afinstaller'
  # spec.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  spec.require_path = 'lib'
end
