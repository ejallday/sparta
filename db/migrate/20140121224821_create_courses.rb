class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :period
      t.references :user

      t.timestamps
    end
  end
end
