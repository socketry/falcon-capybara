# Falcon::Capybara

Provides relevant [capybara] configuration to run tests using [falcon].

[falcon]: https://github.com/socketry/falcon
[capybara]: https://github.com/teamcapybara/capybara

[![Build Status](https://secure.travis-ci.org/socketry/falcon-capybara.svg)](http://travis-ci.org/socketry/falcon-capybara)
[![Code Climate](https://codeclimate.com/github/socketry/falcon-capybara.svg)](https://codeclimate.com/github/socketry/falcon-capybara)
[![Coverage Status](https://coveralls.io/repos/socketry/falcon-capybara/badge.svg)](https://coveralls.io/r/socketry/falcon-capybara)

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
require 'falcon-capybara'

require "capybara/rspec"
Capybara.configure do |config|
	config.server = :falcon

	# config.app = ...
end
```

Optionally, you might want to set up selenium:

```ruby
require "selenium/webdriver"
Capybara.javascript_driver = :selenium_chrome_headless
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
