require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "require body" do
    subject { build(:comment) }

    it { is_expected.to be_valid }
  end
  context "require body" do
    subject { build(:comment, body: nil) }

    it { is_expected.to be_invalid }
  end
  context " title should have a length constraint" do
    it { should validate_length_of(:body).is_at_least(3).is_at_most(200) }
  end
    describe 'association' do
      it { is_expected.to belong_to (:article) } 
    end
end
