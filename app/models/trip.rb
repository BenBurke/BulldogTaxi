class Trip < ActiveRecord::Base
	belongs_to :flight
	belongs_to :cab
	belongs_to :user
end
