class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.text :description
      t.date :date_assigned
      t.date :date_due
      t.integer :points_possible
      t.references :course

      t.timestamps
    end
  end
end
