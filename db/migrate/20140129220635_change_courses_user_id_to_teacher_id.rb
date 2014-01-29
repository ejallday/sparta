class ChangeCoursesUserIdToTeacherId < ActiveRecord::Migration
  def change
    rename_column :courses, :user_id, :teacher_id
  end
end
