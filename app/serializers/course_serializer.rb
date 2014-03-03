class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :period, :created_at, :updated_at, :instructor_last_name, :teacher_id
  has_many :students
end
