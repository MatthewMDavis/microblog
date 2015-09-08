require 'rails_helper'

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
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Log out',     href: logout_path) }
      it { should have_link('Users',       href: users_path) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should_not have_link('Log in', href: login_path) }
    end
  end
  
  describe "authorization" do
    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { log_in non_admin, no_capybara: true }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { expect(response).to redirect_to(root_path) }
      end
    end

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when visiting a protected page" do
        before do
          visit edit_user_path(user)
          fill_in 'Email',     with: user.email
          fill_in 'Password', with: user.password
          click_button 'Log In'
        end
        describe "after signing in" do

          it "should render the desired protected page" do
            expect(page).to have_title('Edit User')
          end

          describe "when signing in again" do
            before do
              delete logout_path
              visit login_path
              fill_in "Email",    with: user.email
              fill_in "Password", with: user.password
              click_button "Log In"
            end

            it "should render the default (profile) page" do
              expect(page).to have_title(user.name)
            end
          end
        end 
      end


      describe "in the Users controller" do

        describe "visiting the users index" do
          before { visit users_path }
          it { should have_title('Log In')  }
        end

      describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title('Log In') }
        end

        describe "submitting to the update action" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(login_path) }
        end

      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { log_in user, no_capybara: true }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_title(full_title('Edit user')) }
      end
      # the update action has no page interface, and thus requires non-capybara test helper
      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_path) }
      end
    end
  end

end