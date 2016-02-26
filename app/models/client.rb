class Client < ActiveRecord::Base
	mount_uploader :logo, LogoUploader
	has_many :campaigns
end
