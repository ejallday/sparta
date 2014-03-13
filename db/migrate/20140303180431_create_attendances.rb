class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :enrollment
      t.string :status, default: 'present', null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
