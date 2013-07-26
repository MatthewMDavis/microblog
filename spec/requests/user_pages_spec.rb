require 'spec_helper'

describe "UserPages" do
  subject { page }
  describe "Sign-up Page" do
    before { visit signup_path }
    it { should have_title(full_title('Sign Up'))}
    it { should have_selector('h1', text: 'Sign Up for The Back 140')}
  end
end
