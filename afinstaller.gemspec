# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "afinstaller/version"

Gem::Specification.new do |spec|
  spec.name          = "afinstaller"
  spec.version       = Afinstaller::VERSION
  spec.authors       = ["Gabe Morales"]
  spec.email         = ["gabomorales@me.com"]

  spec.summary       = %q{This is PW's AF installer}
  spec.description   = %q{This is PW's AF installer}
  spec.homepage      = "https://rubygems.org/gems/afinstaller"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # spec.files         = ["lib/afinstaller.rb", "lib/afinstaller/cli.rb", "config/environment.rb"]
  spec.files        = `git ls-files`.split("\n")
  # spec.executables   << 'afinstaller'
  spec.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  spec.require_path = 'lib'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "rainbow", ">= 0"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"

  spec.add_dependency "activesupport"
  spec.add_dependency "thor"
end
