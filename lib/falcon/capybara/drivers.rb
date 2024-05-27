# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2020-2024, by Samuel Williams.
# Copyright, 2024, by David Siaw.

require 'capybara'

# A selenium driver for chrome which allows insecure localhost https protocol.
# @scope Falcon Capybara Drivers
# @name selenium_chrome_https
# @attribute [Block]
Capybara.register_driver :selenium_chrome_https do |app|
  chrome_options = Selenium::WebDriver::Chrome::Options.new
  chrome_options.add_argument('--allow-insecure-localhost')
  chrome_options.add_argument('--ignore-certificate-errors')
  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome,
                                 options: chrome_options)
end

# A headless selenium driver for chrome which allows insecure localhost https protocol.
# @scope Falcon Capybara Drivers
# @name selenium_chrome_headless_https
# @attribute [Block]
Capybara.register_driver :selenium_chrome_headless_https do |app|
  chrome_options = Selenium::WebDriver::Chrome::Options.new
  chrome_options.add_argument('--allow-insecure-localhost')
  chrome_options.add_argument('--ignore-certificate-errors')
  chrome_options.add_argument('--headless=true')
  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome,
                                 options: chrome_options)
end
