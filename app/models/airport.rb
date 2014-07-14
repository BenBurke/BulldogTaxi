class Airport < ActiveRecord::Base
	has_and_belongs_to_many :carriers
	has_many :trips
	has_many :flights
end
