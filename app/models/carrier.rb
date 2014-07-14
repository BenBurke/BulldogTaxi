class Carrier < ActiveRecord::Base
	has_many :flights
	has_and_belongs_to_many :airports
end
