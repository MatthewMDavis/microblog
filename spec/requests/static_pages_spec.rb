require 'rails_helper'


describe "StaticPages" do
	subject { page }
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end
  describe "Home Page" do
  	before { visit root_path }
    let(:heading) { 'The Back 140' }
    let(:page_title) { 'Home' }
    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end
  describe "Help Page" do
  	before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"
	end
  describe "About Page" do
  	before { visit about_path }
    let(:heading) { 'About Us' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"
	end	
  describe "Contact Us" do
  	before { visit contact_path }
    let(:heading) { 'Contact Us' }
    let(:page_title) { 'Contact Us' }
    it_should_behave_like "all static pages"
  end
  it "should have the right links on the layout" do
    visit root_path
    click_link 'Log in'
    expect(page).to have_title(full_title('Log In'))
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_selector('h1', text: 'Contact Us')
    click_link "Home"
    expect(page).to have_title(full_title('Home'))
    click_link "Sign up now!"
    expect(page).to have_selector('h1', text: 'Sign Up')
  end  
end
