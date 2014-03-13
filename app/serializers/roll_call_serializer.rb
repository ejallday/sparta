class RollCallSerializer < ActiveModel::Serializer
  attributes :course_id, :attendance_statuses

  has_many :attendances
end
