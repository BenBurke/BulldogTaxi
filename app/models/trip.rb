class Trip < ActiveRecord::Base
	has_one :flight, dependent: :destroy
	accepts_nested_attributes_for :flight
	default_scope -> { order('created_at DESC') }
	belongs_to :cab
	belongs_to :user
end
  