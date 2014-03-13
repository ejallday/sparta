class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :student_initials
end
