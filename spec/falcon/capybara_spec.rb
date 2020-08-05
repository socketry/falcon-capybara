# Copyright, 2020, by Samuel G. D. Williams. <http://www.codeotaku.com>
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
