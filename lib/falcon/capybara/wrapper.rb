# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2018-2024, by Samuel Williams.
# Copyright, 2021, by Philip Arndt.
# Copyright, 2022, by William T. Nelson.
# Copyright, 2024, by David Siaw.

require 'thread'

require 'async'
require 'falcon/endpoint'

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
