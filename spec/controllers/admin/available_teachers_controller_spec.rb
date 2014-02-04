require 'spec_helper'

describe Admin::AvailableTeachersController do
  it_behaves_like 'a restricted-access controller', for: %i(index)
end
