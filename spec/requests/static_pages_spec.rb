require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the title 'The Back 140 Microblog'" do
      # first, just visit the page and look for the content
      visit '/static_pages/home'      
      expect(page).to have_title('The Back 140 Microblog | Home')
    end
    it "should have the content 'The Back 140 Microblog'" do
      # first, just visit the page and look for the content
      visit '/static_pages/home'      
      expect(page).to have_content('The Back 140 Microblog')
    end
  end
  describe "Help Page" do
    it "should have the title 'Help'" do
      # first, just visit the page and look for the content
      visit '/static_pages/help'      
      expect(page).to have_title('The Back 140 Microblog | Help')
    end
  	it "should have the text 'Help'" do
			visit '/static_pages/help'
  		expect(page).to have_content('Help')	
		end	
	end
  describe "About Page" do
    it "should have the title 'About Us'" do
      # first, just visit the page and look for the content
      visit '/static_pages/about'      
      expect(page).to have_title('The Back 140 Microblog | About Us')
    end
  	it "should have a title that includes 'About Us'" do
			visit '/static_pages/about'
  		expect(page).to have_content('About Us')	
		end	
  end
end
