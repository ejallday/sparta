require 'spec_helper'

describe Admin::StudentsController do
  it_behaves_like 'a restricted-access controller', for: %i(new create show)
end
