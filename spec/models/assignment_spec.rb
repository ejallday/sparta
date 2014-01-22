require 'spec_helper'

describe Assignment do
  it { should belong_to(:course) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:date_assigned) }
  it { should validate_presence_of(:date_due) }
  it { should validate_presence_of(:points_possible) }
end
