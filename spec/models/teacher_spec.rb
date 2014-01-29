require 'spec_helper'

describe Teacher do
  it { should belong_to(:user) }
  it { should have_many(:courses) }
end
