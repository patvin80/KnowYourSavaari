class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :vehicle_type_name ,:null=>false

      t.timestamps
    end
  end
end
