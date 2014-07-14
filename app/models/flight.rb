class Flight < ActiveRecord::Base
	has_many :trips
	belongs_to :carrier
	belongs_to :departure_airport, class_name: "Airport"
	belongs_to :arrival_airport, class_name: "Airport"
	
end
