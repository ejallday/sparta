class RollCall
  include ActiveModel::Model
  include ActiveModel::SerializerSupport

  attr_accessor :date, :course
  delegate :id, to: :course, prefix: true

  def initialize(date, course)
    super(date: date, course: course)
  end

  def attendances
    if existing_attendances.any?
      existing_attendances
    else
      new_attendances
    end
  end

  def update_statuses(statuses)
    attendances.each do |attendance|
      attendance.status = statuses[attendance.id.to_s]
      attendance.save!
    end
  end

  def attendance_statuses
    Hash[attendances.map do |attendance|
      [attendance.id, attendance.status]
    end]
  end

  def persisted?
    true
  end

  private

  def existing_attendances
    @existing_attendances ||= Attendance
      .where(date: date, enrollments: { course_id: course })
      .includes(enrollment: [student: :user ])
      .references(enrollment: [student: :user ])
  end

  def new_attendances
    course.enrollments.map do |enrollment|
      Attendance.create(enrollment: enrollment)
    end
  end
end
