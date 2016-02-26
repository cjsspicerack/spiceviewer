class Advert < ActiveRecord::Base
	mount_uploader :files, AdvertUploader
	belongs_to :campaign

end