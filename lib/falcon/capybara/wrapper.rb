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
		class Wrapper
			def initialize(scheme = "http")
				@scheme = scheme
			end
			
			def endpoint(host, port)
				Falcon::Endpoint.parse("#{@scheme}://#{host}:#{port}")
			end
			
			def call(rack_app, port, host)
				require 'async/reactor'
				require 'falcon/server'
				
				Async do |task|
					app = Falcon::Server.middleware(rack_app)
					
					if host == "127.0.0.1"
						host = "localhost"
					end
					
					endpoint = self.endpoint(host, port)
					
					server = Falcon::Server.new(app, endpoint, endpoint.protocol, endpoint.scheme)
					
					Async.logger.debug (self) {"Running server..."}
					server.run
				end
			end
		end
	end
end
