
require "spec_helper"

RSpec.describe Falcon::Capybara, type: :feature, js: true do
	include Rack::Test::Methods
	
	it "can use capybara to extract body" do
		visit "/"
		
		expect(page).to have_content "Hello World"
	end
end
