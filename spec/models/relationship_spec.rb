require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }

  let(:relationship) { follower.relationships.build(followed_id: followed.id)}

  subject { relationship }
  
  it { should be_valid }

  describe "with follower id not set" do
    before { subject.follower_id = nil }
    it { should_not be_valid }
  end
 
  describe "with followed id not set" do
    before { subject.followed = nil }
    it { should_not be_valid }
  end
  
  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    it 'has a correct follower' do
      expect(subject.follower).to eq(follower)
    end
    it 'has a correct followed' do
      expect(subject.followed).to eq(followed)
    end
  end
end
