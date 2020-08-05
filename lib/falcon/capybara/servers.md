# Falcon::Capybara::Servers

Provides Capybara server definitions for using Falcon with Capybara integration & acceptance tests.

## Usage

In your Capybara configuration, you'd typically select one of the named server configurations:

~~~ ruby
Capybara.configure do |config|
	config.server = :falcon_https
end
~~~
