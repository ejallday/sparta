require 'spec_helper'

describe RollCall do
  describe '#attendances' do
    it 'returns all attendances for a given course and date' do
      course = create(:course)
      student1 = create(:student)
      enrollment1 = Enrollment.create!(student: student1, course: course)
      student2 = create(:student)
      enrollment2 = Enrollment.create!(student: student2, course: course)
      attendances = [
        Attendance.create(enrollment: enrollment1),
        Attendance.create(enrollment: enrollment2, status: 'tardy'),
      ]

      roll_call = RollCall.new(Date.current, course)

      expect(roll_call.attendances).to eq(attendances)
    end

    it 'returns new attendances if none exist already' do
      course = create(:course)
      student1 = create(:student)
      Enrollment.create!(student: student1, course: course)
      student2 = create(:student)
      Enrollment.create!(student: student2, course: course)

      roll_call = RollCall.new(Date.current, course)

      expect(roll_call.attendances).to eq(Attendance.all)
    end
  end
end
