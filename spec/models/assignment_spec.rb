require 'spec_helper'

describe Assignment do
  it { should belong_to(:course) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:assigned_on) }
  it { should validate_presence_of(:due_on) }
  it { should validate_presence_of(:points_possible) }
end
