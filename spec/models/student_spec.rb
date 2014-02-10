require 'spec_helper'

describe Student do
  it { should belong_to(:user) }
  it { should have_many(:guardianships) }
  it { should have_many(:guardians) }
end
