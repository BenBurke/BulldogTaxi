class User < ActiveRecord::Base
	has_many :trips, dependent: :destroy
	mount_uploader :image, ImageUploader

end
