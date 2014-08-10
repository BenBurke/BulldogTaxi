class User < ActiveRecord::Base
	has_many :trips, dependent: :destroy
	belongs_to :college
	mount_uploader :image, ImageUploader

	validates :netid, uniqueness: true
end
