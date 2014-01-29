require 'spec_helper'

describe Teacher do
  it { should belong_to(:user) }
end
