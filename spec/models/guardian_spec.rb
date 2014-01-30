require 'spec_helper'

describe Guardian do
  it { should belong_to(:user) }
end
