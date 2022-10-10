# frozen_string_literal: true

require_relative "lib/falcon/capybara/version"

Gem::Specification.new do |spec|
	spec.name = "falcon-capybara"
	spec.version = Falcon::Capybara::VERSION
	
	spec.summary = "Use the falcon web server to run capybara/selenium tests."
	spec.authors = ["Samuel Williams", "Philip Arndt", "William T. Nelson"]
	spec.license = "MIT"
	
	spec.cert_chain  = ['release.cert']
	spec.signing_key = File.expand_path('~/.gem/release.pem')
	
	spec.homepage = "https://github.com/socketry/falcon-capybara"
	
	spec.files = Dir.glob(['{lib}/**/*', '*.md'], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 2.5"
	
	spec.add_dependency "capybara", "~> 3.37"
	spec.add_dependency "falcon", "~> 0.34"
	spec.add_dependency "selenium-webdriver"
	
	spec.add_development_dependency "bake"
	spec.add_development_dependency "bundler"
	spec.add_development_dependency "covered"
	spec.add_development_dependency "rspec", "~> 3.0"
	spec.add_development_dependency "webdrivers", "~> 4.0"
end
