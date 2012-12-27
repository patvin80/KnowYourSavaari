class VehicleInspection < ActiveRecord::Base
  attr_accessible :expiration_date, :inspection_agency, :is_current, :vehicle_id
  belongs_to :vehicle
end
