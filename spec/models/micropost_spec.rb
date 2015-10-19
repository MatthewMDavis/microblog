require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  before do
 	@micropost = user.microposts.build(content: "lorem ipsum")
  end
  subject { @micropost }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should be_valid }
  it { should respond_to(:user) }
  specify { expect(subject.user).to eq(user) }

  describe "when user id is not present" do
 	before { @micropost.user_id = nil }	
 	it { should_not be_valid }
  end
  describe "when content is blank" do
  	before { @micropost.content = " " }	
  	it { should_not be_valid }
  end
  describe "when content is over long" do
  	before { @micropost.content = "x" * 141 }	
  	it { should_not be_valid }
  end
end
