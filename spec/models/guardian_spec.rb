require 'spec_helper'

describe Guardian do
  it { should belong_to(:user) }
  it { should have_many(:guardianships) }
  it { should have_many(:students) }
end
