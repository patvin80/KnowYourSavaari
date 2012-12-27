class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :state_code, :null => false
      t.integer :state_number, :null => false
      t.string :plate_letter, :null => false
      t.integer :plate_number, :null => false

      t.timestamps
    end
  end
end
