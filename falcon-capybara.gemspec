# frozen_string_literal: true

require_relative "lib/falcon/capybara/version"

Gem::Specification.new do |spec|
	spec.name = "falcon-capybara"
	spec.version = Falcon::Capybara::VERSION
	
	spec.summary = "Use the falcon web server to run capybara/selenium tests."
	spec.authors = ["Samuel Williams", "David Siaw", "Philip Arndt", "William T. Nelson"]
	spec.license = "MIT"
	
	spec.cert_chain  = ['release.cert']
	spec.signing_key = File.expand_path('~/.gem/release.pem')
	
	spec.homepage = "https://github.com/socketry/falcon-capybara"
	
	spec.metadata = {
		"documentation_uri" => "https://socketry.github.io/falcon-capybara/",
		"source_code_uri" => "https://github.com/socketry/falcon-capybara.git",
	}
	
	spec.files = Dir.glob(['{lib}/**/*', '*.md'], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 3.1"
	
	spec.add_dependency "capybara", "~> 3.37"
	spec.add_dependency "falcon"
	spec.add_dependency "selenium-webdriver"
end
