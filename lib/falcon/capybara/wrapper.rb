# Copyright, 2017, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'thread'

require 'async'
require 'falcon/endpoint'
require 'async/io/notification'

module Falcon
	module Capybara
		# Implements a wrapper for starting the Falcon server for Capybara.
		class Wrapper
			# @parameter scheme [String] The scheme for the server to bind to.
			# 	e.g. `http` or `https`.
			def initialize(scheme = "http")
				@scheme = scheme
			end
			
			# Build a server endpoint using the given scheme.
			def endpoint(host, port)
				Falcon::Endpoint.parse("#{@scheme}://#{host}:#{port}")
			end
			
			# Run the Falcon server hosting the given rack application.
			# @parameter rack_app [Proc] A Rack application.
			# @parameter port [Integer] The port number to bind to.
			# @parameter host [String] The local host to bind to.
			def call(rack_app, port, host)
				require 'async/reactor'
				require 'falcon/server'
				
				Async do |task|
					app = Falcon::Server.middleware(rack_app)
					
					if host == "127.0.0.1"
						host = "localhost"
					end
					
					endpoint = self.endpoint(host, port)
					
					server = Falcon::Server.new(app, endpoint, protocol: endpoint.protocol, scheme: endpoint.scheme)
					
					Console.logger.debug (self) {"Running server..."}
					server.run
				end
			end
		end
	end
end
