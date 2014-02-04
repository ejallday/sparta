require 'spec_helper'

describe Course do
  it { should belong_to(:teacher) }

  describe '#instructor_last_name' do
    it 'delegates to its teacher' do
      course = Course.new(teacher: build(:teacher, last_name: 'Bojangles'))
      expect(course.instructor_last_name).to eq('Bojangles')
    end
  end

  describe '#instructor_first_name' do
    it 'delegates to its teacher' do
      course = Course.new(teacher: build(:teacher, first_name: 'Eric'))
      expect(course.instructor_first_name).to eq('Eric')
    end
  end

  describe '#instructor_full_name' do
    it 'delegates to its teacher' do
      course = Course.new(teacher: build(:teacher, first_name: 'Mr', last_name: 'Bojangles'))
      expect(course.instructor_full_name).to eq('Mr Bojangles')
    end
  end
end
