
require 'covered/rspec'
require "bundler/setup"

require 'capybara'
Capybara.register_driver :chrome do |app|
	options = Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox headless disable-gpu])
	
	Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome

require "falcon/capybara"

require "webdrivers"
require "selenium/webdriver"

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
