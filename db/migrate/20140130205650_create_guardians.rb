class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
			t.references :user
			
      t.timestamps
    end
  end
end
