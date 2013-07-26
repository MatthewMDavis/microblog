require 'spec_helper'


describe "StaticPages" do
	subject { page }
	let(:base_title) { "The Back 140 Microblog"}
  describe "Home Page" do
  	before { visit root_path }
    it { should have_title(full_title("Home")) }
    it { should have_content('The Back 140 Microblog') }
    it { should_not have_title('| Home') }
  end
  describe "Help Page" do
  	before { visit help_path }
    it { should have_title(full_title("Help")) }
  	it { should have_content('Help') }
	end
  describe "About Page" do
  	before { visit about_path }
    it { should have_title(full_title("About Us")) }
  	it { should have_content('About Us') }
	end	
  describe "Contact Us" do
  	before { visit contact_path }
    it { should have_title(full_title("Contact Us")) }
  	it { should have_content('Contact')	}
  end
end
