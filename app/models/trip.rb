class Trip < ActiveRecord::Base
	has_many :flights, dependent: :destroy
	accepts_nested_attributes_for :flights
	belongs_to :cab
	belongs_to :user
end
