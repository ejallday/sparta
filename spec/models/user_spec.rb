require 'spec_helper'

describe User do
  it { should have_many(:courses) }

  describe 'when signing up' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe '#full_name' do
    it 'returns concatenated first & last name' do
      user = create(:user, first_name: 'Joe', last_name: 'Blow')
      expect(user.full_name).to eq('Joe Blow')
    end
  end
end
