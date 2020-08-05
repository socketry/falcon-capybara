# Falcon::Capybara::Drivers

Provides Capybara driver definitions for using Chrome with self-signed HTTPS via localhost **only**.

## Usage

In your Capybara configuration, you'd typically select one of the named server configurations:

~~~ ruby
Capybara.configure do |config|
	config.javascript_driver = :selenium_chrome_https
	
	# Or for headless:
	config.javascript_driver = :selenium_chrome_headless_https
end
~~~
