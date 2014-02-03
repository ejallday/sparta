require 'spec_helper'

describe Course do
  it { should belong_to(:teacher) }

  describe '#instructor_last_name' do
    it 'delegates to its teacher' do
    	course = Course.new(teacher: build(:teacher, last_name: 'Bojangles'))
      expect(course.instructor_last_name).to eq('Bojangles')
    end
  end
end
