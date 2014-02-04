require 'spec_helper'

describe Guardians::DashboardsController do
  it_behaves_like 'a restricted-access controller', for: %i(show)
end
