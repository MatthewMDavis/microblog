require 'rails_helper'
describe User do
  before { @user = User.new(name:'Matt Davis', email:'mattmdavis@gmail.com',
            password:'foobar', password_confirmation:'foobar') }
  subject { @user }
  it { should be_valid }
  it { should respond_to(:admin) }
  it { should_not be_admin }
  it { should respond_to(:email) }
  it { should respond_to(:name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate)}
  it { should respond_to(:microposts) }


  describe "with user permissions set to admin" do
     before do
       @user.save!
       @user.toggle!(:admin)
     end
     it { should be_admin }
   end

  describe "an overlong name" do
    before { @user.name = 'x' * 51 }
    it { should_not be_valid }
  end

  describe "with a blank name" do
    before { @user.name = ' ' }
    it { should_not be_valid }
  end

  describe "with a blank email" do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end

  describe "with a properly formatted email addy" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_email|
        @user.email = valid_email
        expect(@user).to be_valid
      end
    end
  end

  describe "with a badly formatted email addy" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_addy|
        @user.email = invalid_addy
        expect(@user).not_to be_valid
      end
    end
  end

  describe "with a mixed-case email addy" do
    let(:mixed_case_email) { 'MixedCase@miXtape.com' }
    it "should save in lower case" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be false }
    end
  end
  describe "remember token" do
    before { @user.save }
    specify {expect(subject.remember_token).not_to be_blank}
  end
  describe "micropost associations" do
    before { @user.save }
    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_micropost) { FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago) }
    it "should return microposts in the right order" do
      expect(@user.microposts.to_a).to eq([newer_micropost, older_micropost])
    end
    it "should destroy user microposts when user is destroyed" do
      microposts = @user.microposts.to_a
      @user.destroy
      expect(microposts).not_to be_empty
      microposts.each do |tweet|
        expect(Micropost.where(id: tweet.id)).to be_empty
      end
    end
    describe "status" do
      let(:unfollowed_post) do
        other_user = FactoryGirl.create(:user)
        FactoryGirl.create(:micropost, user: other_user)
      end
      it 'contains only the correct microposts' do
        expect(subject.feed).to include newer_micropost
        expect(subject.feed).to include older_micropost
        expect(subject.feed).not_to include unfollowed_post
      end
    end
  end
end

