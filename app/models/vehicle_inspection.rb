class VehicleInspection < ActiveRecord::Base
  attr_accessible :expiration_date, :inspection_agency, :is_current, :vehicle_id
  belongs_to :vehicle

  validates_inclusion_of :is_current, :in => [true, false]
end
