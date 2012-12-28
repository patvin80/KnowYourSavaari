class Vehicle < ActiveRecord::Base
	before_create :upcase_letters

	def upcase_letters
	   	self.plate_letter.upcase! if self.plate_letter
		self.state_code.upcase! if self.state_code
	end

  attr_accessible :plate_letter, :plate_number, :state_code, :state_number, :vehicle_inspections_attributes
  has_many :vehicle_inspections
  validates_presence_of :plate_letter,:plate_number, :state_code, :state_number 
  accepts_nested_attributes_for :vehicle_inspections
end
