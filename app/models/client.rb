class Client < ActiveRecord::Base
	mount_uploader :logo, LogoUploader
end
