require 'spec_helper'

describe "UserPages" do
  subject { page }
  describe "signup page" do
    before { visit signup_path }
    it { should have_title(full_title('Sign Up'))}
    it { should have_selector('h1', text: 'Sign Up for The Back 140')}
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account"}
    describe "with invalid user info" do
    	it "should not create a user record" do
    		expect{ click_button submit }.not_to change(User, :count)	
    	end
    end
    describe "with valid user info" do
      before do
        fill_in "Name", with: "Matt Davis"
        fill_in "Email", with: "mattmdavis@gmail.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user record" do
        expect{ click_button submit }.to change(User, :count)
      end
    end
  end
end
