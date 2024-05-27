# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2017-2024, by Samuel Williams.

RSpec.describe Falcon::Capybara, type: :feature, js: true do
	# Capybara must be in thread safe mode for this to work correctly.
	
	describe 'Capybara.servers[:falcon]' do
		it "can use capybara to extract body" do
			Capybara.using_driver(:selenium_chrome_headless) do
				Capybara.server = :falcon
				
				visit "/"
				expect(page).to have_content "Hello World (http)"
			end
		end
	end
	
	describe 'Capybara.servers[:falcon_http]' do
		it "can use capybara to extract body" do
			Capybara.using_driver(:selenium_chrome_headless) do
				Capybara.server = :falcon_http
				
				visit "/"
				expect(page).to have_content "Hello World (http)"
			end
		end
	end
	
	describe 'Capybara.servers[:falcon_https]' do
		it "can use capybara to extract body" do
			Capybara.using_driver(:selenium_chrome_headless_https) do
				Capybara.server = :falcon_https
				
				visit "/"
				expect(page).to have_content "Hello World (https)"
			end
		end
	end
end
