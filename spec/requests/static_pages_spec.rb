require 'spec_helper'


describe "StaticPages" do
	let(:base_title) { "The Back 140 Microblog"}
  describe "Home Page" do
    it "should have the title 'The Back 140 Microblog'" do
      # first, just visit the page and look for the content
      visit '/static_pages/home'      
      expect(page).to have_title("#{base_title}")
    end
    it "should have the content 'The Back 140 Microblog'" do
      # first, just visit the page and look for the content
      visit '/static_pages/home'      
      expect(page).to have_content('The Back 140 Microblog')
    end
    it "should not have '| Home' in the title" do
      # first, just visit the page and look for the content
      visit '/static_pages/home'      
      expect(page).not_to have_title('| Home')
    end

  end
  describe "Help Page" do
    it "should have the title 'Help'" do
      # first, just visit the page and look for the content
      visit '/static_pages/help'      
      expect(page).to have_title("#{base_title} | Help")
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
      expect(page).to have_title("#{base_title} | About Us")
    end
  	it "should have a title that includes 'About Us'" do
			visit '/static_pages/about'
  		expect(page).to have_content('About Us')	
		end	
  end
    describe "Contact Us" do
    it "should have the title 'Contact Us'" do
      # first, just visit the page and look for the content
      visit '/static_pages/contact'      
      expect(page).to have_title("#{base_title} | Contact Us")
    end
  	it "should have a title that includes 'Contact'" do
			visit '/static_pages/contact'
  		expect(page).to have_content('Contact')	
		end	
  end
end
