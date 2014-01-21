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
end
