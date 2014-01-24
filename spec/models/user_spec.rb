require 'spec_helper'

describe User do
  describe 'when signing up' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should_not allow_value('abcde').for(:username) }
  end

  describe '#full_name' do
    it 'returns concatenated first & last name' do
      user = create(:user, first_name: 'Joe', last_name: 'Blow')
      expect(user.full_name).to eq('Joe Blow')
    end
  end
end
