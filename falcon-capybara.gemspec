
require_relative "lib/falcon/capybara/version"

Gem::Specification.new do |spec|
	spec.name = "falcon-capybara"
	spec.version = Falcon::Capybara::VERSION
	
	spec.summary = "Use the falcon web server to run capybara/selenium tests."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.homepage = "https://github.com/socketry/falcon-capybara"
	
	spec.files = Dir['{lib}/**/*', base: __dir__]

	spec.required_ruby_version = ">= 2.5"
	
	spec.add_dependency "capybara"
	spec.add_dependency "falcon", "~> 0.34"
	spec.add_dependency "selenium-webdriver"
	
	spec.add_development_dependency "bake"
	spec.add_development_dependency "bake-bundler"
	spec.add_development_dependency "bake-modernize"
	spec.add_development_dependency "bundler"
	spec.add_development_dependency "covered"
	spec.add_development_dependency "rspec", "~> 3.0"
	spec.add_development_dependency "webdrivers", "~> 4.0"
end
