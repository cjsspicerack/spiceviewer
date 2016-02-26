class Campaign < ActiveRecord::Base
	has_many :adverts
	belongs_to :client
end
