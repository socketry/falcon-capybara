# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2020, by Samuel Williams.

require "spec_helper"

require 'falcon/capybara/servers'

RSpec.describe 'Capybara.servers' do
	it "has registered servers correctly" do
		expect(Capybara.servers[:falcon]).to_not be_nil
		expect(Capybara.servers[:falcon_http]).to_not be_nil
		expect(Capybara.servers[:falcon_https]).to_not be_nil
	end
end
