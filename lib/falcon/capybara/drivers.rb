# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2020, by Samuel Williams.

require 'capybara'

# A selenium driver for chrome which allows insecure localhost https protocol.
# @scope Falcon Capybara Drivers
# @name selenium_chrome_https
# @attribute [Block]
Capybara.register_driver :selenium_chrome_https do |app|
	require 'selenium/webdriver'
	
	Capybara.drivers[:selenium_chrome].call(app).tap do |driver|
		driver.options[:capabilities].args << '--allow-insecure-localhost'
	end
end

# A headless selenium driver for chrome which allows insecure localhost https protocol.
# @scope Falcon Capybara Drivers
# @name selenium_chrome_headless_https
# @attribute [Block]
Capybara.register_driver :selenium_chrome_headless_https do |app|
	require 'selenium/webdriver'
	
	Capybara.drivers[:selenium_chrome_headless].call(app).tap do |driver|
		driver.options[:capabilities].args << '--allow-insecure-localhost'
	end
end
