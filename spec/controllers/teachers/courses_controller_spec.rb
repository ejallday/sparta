require 'spec_helper'

describe Teachers::CoursesController do
  it_behaves_like 'a restricted-access controller', for: %i(index show)
end
