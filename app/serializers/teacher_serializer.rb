class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :last_name
end
