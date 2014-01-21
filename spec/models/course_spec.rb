require 'spec_helper'

describe Course do
  it { should belong_to(:teacher) }

  describe '#instructor_last_name' do
    it 'delegates to its teacher' do
      teacher = create(:user, last_name: 'Bojangles')
      course = create(:course, teacher: teacher)
      expect(course.instructor_last_name).to eq('Bojangles')
    end
  end
end
