
if ENV['COVERAGE'] || ENV['TRAVIS']
	begin
		require 'simplecov'
		
		SimpleCov.start do
			add_filter "/spec/"
		end
		
		if ENV['TRAVIS']
			require 'coveralls'
			Coveralls.wear!
		end
	rescue LoadError
		warn "Could not load simplecov: #{$!}"
	end
end

require "bundler/setup"

require "falcon/capybara"

require "selenium/webdriver"
Capybara.javascript_driver = :selenium_chrome_headless

require "capybara/rspec"

Capybara.configure do |config|
	config.server = :falcon

	config.app = Rack::Builder.parse_file(File.join(__dir__, "config.ru")).first
end

RSpec.configure do |config|
	# Enable flags like --only-failures and --next-failure
	config.example_status_persistence_file_path = ".rspec_status"

	config.expect_with :rspec do |c|
		c.syntax = :expect
	end
end
