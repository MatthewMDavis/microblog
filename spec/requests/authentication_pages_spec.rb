require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit login_path }

    it { should have_title('Log In') }
    it { should have_selector('h1', 'Log in') }
  end

  describe "Log in" do
    before { visit login_path }

    describe "with invalid credentials" do
      before { click_button 'Log In' }

      it { should have_title('Log In') }
      it { should have_selector('div.alert.alert-error', 'Invalid')}
      describe "after visiting another page" do
        before { click_link 'Home' }
        it { should_not have_selector('div.alert.alert-error', 'Invalid') }
      end
    end

    describe "with valid credentials" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Log In"
      end

      it { should have_title(user.name) }
      it { should have_link('Profile',    href: user_path(user)) }
      it { should have_link('Log out',   href: logout_path) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should_not have_link('Log in', href: login_path) }
    end
  end
  
end