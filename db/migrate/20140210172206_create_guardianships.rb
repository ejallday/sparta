class CreateGuardianships < ActiveRecord::Migration
  def change
    create_table :guardianships do |t|
      t.references :guardian, null: false, index: true
      t.references :student, null: false, index: true

      t.timestamps
    end
  end
end
