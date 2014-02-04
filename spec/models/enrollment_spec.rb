require 'spec_helper'

describe Enrollment do
  it { should belong_to :student }
  it { should belong_to :course }
end
