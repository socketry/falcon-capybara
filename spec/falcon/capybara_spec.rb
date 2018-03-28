
require "spec_helper"

RSpec.describe Falcon::Capybara, :type => :feature, :js => true do
	include Rack::Test::Methods
	
	it "can use capybara to extract body" do
		visit "/"
		
		expect(page).to have_content "Hello World"
	end
	
	it "can run code on server thread" do
		visit "/"
		
		remote_thread_name = nil
		
		Capybara.server.remote do
			remote_thread_name = Thread.current.to_s
		end
		
		expect(remote_thread_name).to_not be_nil
		expect(remote_thread_name).to_not be == Thread.current.to_s
	end
end
