class Flight < ActiveRecord::Base
	belongs_to :trip
	belongs_to :carrier
	belongs_to :departure_airport, class_name: "Airport"
	belongs_to :arrival_airport, class_name: "Airport"
	
end
