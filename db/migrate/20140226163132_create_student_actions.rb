class CreateStudentActions < ActiveRecord::Migration
  def change
    create_table :student_actions do |t|
      t.references :enrollment
      t.string :name

      t.timestamps
    end
  end
end
