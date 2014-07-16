class Trip < ActiveRecord::Base
	has_one :flight, dependent: :destroy
	accepts_nested_attributes_for :flight
	belongs_to :cab
	belongs_to :user
end
  