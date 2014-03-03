class StudentSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :first_name, :last_name, :initials, :full_name
end
