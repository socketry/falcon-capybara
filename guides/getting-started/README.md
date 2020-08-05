# Getting Started

This guide explains how to use `falcon-capybara` for tests.

## Installation

Add the gem to your project:

~~~ bash
$ bundle add --group test falcon-capybara
~~~

## RSpec Integration

In your `spec_helper.rb` add the following:

~~~ ruby
require 'rack/test'
require 'falcon/capybara'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium/webdriver'

Capybara.configure do |config|
	config.app = Rack::Builder.parse_file(
		File.expand_path('../config.ru', __dir__)
	).first
	
	# For HTTPS:
	config.server = :falcon_https
	config.default_driver = :selenium_chrome_https
	config.javascript_driver = :selenium_chrome_https
	# For headless, use `:selenium_chrome_headless_https`
	
	# For HTTP:
	config.server = :falcon_http
	config.default_driver = :selenium_chrome
	config.javascript_driver = :selenium_chrome
	# For headless, use `:selenium_chrome_headless`
end
~~~

### Capybara Shared Context

You can define a shared context which incorporates the Capybara DSL:

~~~ ruby
# A capybara context which is attached to a browser:
RSpec.shared_context Capybara do
	include Capybara::DSL
end
~~~

Then, in your own code:

~~~ ruby
RSpec.describe "My Website" do
	include_context Capybara
	
	it "should get welcome page" do
		visit "/"
		expect(page).to have_content("Welcome")
	end
end
~~~

### `Rack::Test` Shared Context

You can also reuse the `Capybara.app` instance (your application) with `Rack::Test` for more direct testing:

~~~ ruby
# A rack test context that issues mocked requests directly against the web app:
RSpec.shared_context Rack::Test do
	include Rack::Test::Methods
	let(:app) {Capybara.app}
end
~~~

Then, in your own code:

~~~ ruby
RSpec.describe "My Website" do
	include_context Rack::Test
	
	it "should get welcome page" do
		get "/"
		expect(last_response.body).to have_content("Welcome")
	end
end
~~~
