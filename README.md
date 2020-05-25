# Falcon::Capybara

Provides relevant [capybara] configuration to run tests using [falcon].

[falcon]: https://github.com/socketry/falcon
[capybara]: https://github.com/teamcapybara/capybara

[![Development Status](https://github.com/socketry/falcon-capybara/workflows/Development/badge.svg)](https://github.com/socketry/falcon-capybara/actions?workflow=Development)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'falcon-capybara'
```

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install falcon-capybara

## Usage

### RSpec

In your `spec_helper.rb` add the following:

```ruby
require 'rack/test'
require 'falcon/capybara'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium/webdriver'

Capybara.configure do |config|
	config.app = Rack::Builder.parse_file(
		File.expand_path('../config.ru', __dir__)
	).first
	
	config.threadsafe = false
	
	# For HTTPS:
	config.server = :falcon_https
	config.default_driver = :selenium_chrome_https
	config.javascript_driver = :selenium_chrome_https
	
	# For HTTP:
	config.server = :falcon_http
	config.default_driver = :selenium_chrome
	config.javascript_driver = :selenium_chrome
end

RSpec.shared_context "website" do
	include Rack::Test::Methods
	include Capybara::DSL
	
	let(:app) {Capybara.app}
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the MIT license.

Copyright, 2017, by [Samuel G. D. Williams](http://www.codeotaku.com/samuel-williams).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
