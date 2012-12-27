class CreateVehicleInspections < ActiveRecord::Migration
  def change
    create_table :vehicle_inspections do |t|
      t.boolean :is_current, :null => false
      t.date :expiration_date
      t.string :inspection_agency
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
