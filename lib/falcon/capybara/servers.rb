# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2020, by Samuel Williams.

require 'capybara'

# The default Falcon server wrapper which uses the `HTTP` scheme.
# @scope Falcon Capybara Servers
# @name falcon
# @attribute [Block]
Capybara.register_server(:falcon) do |*arguments|
	require_relative 'wrapper'
	Falcon::Capybara::Wrapper.new.call(*arguments)
end

# An explicit Falcon server wrapper which uses the `HTTP` scheme.
# @scope Falcon Capybara Servers
# @name falcon_http
# @attribute [Block]
Capybara.register_server(:falcon_http) do |*arguments|
	require_relative 'wrapper'
	Falcon::Capybara::Wrapper.new('http').call(*arguments)
end

# The default Falcon server wrapper which uses the `HTTPS` scheme.
# @scope Falcon Capybara Servers
# @name falcon_https
# @attribute [Block]
Capybara.register_server(:falcon_https) do |*arguments|
	require_relative 'wrapper'
	Falcon::Capybara::Wrapper.new('https').call(*arguments)
end
