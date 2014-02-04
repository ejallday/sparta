require 'spec_helper'

describe Teachers::AssignmentsController do
  it_behaves_like 'a restricted-access controller', for: %i(index new create)
end
