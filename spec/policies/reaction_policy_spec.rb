require 'rails_helper'

RSpec.describe ReactionPolicy do

  subject { ReactionPolicy.new(user, reaction) }

  let(:reaction) { FactoryGirl.build(:reaction) }
  let(:user) { FactoryGirl.build(:user) }

  context 'being a visitor' do
    let(:user) { nil }

    it { should forbid_action(:show) }
    it { should forbid_action(:update) }
    it { should forbid_action(:destroy) }
  end

  context 'being a user' do
    it { should forbid_action(:show) }
    it { should forbid_action(:update) }
    it { should forbid_action(:destroy) }
  end

  context 'being an admin' do
    let(:user) { FactoryGirl.build(:admin) }

    it { should permit_action(:show) }
    it { should permit_action(:create) }
    it { should permit_action(:update) }
    it { should permit_action(:destroy) }
  end

end
