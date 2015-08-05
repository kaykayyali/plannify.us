class ConfirmedService < ActiveRecord::Base
	belongs_to :event
	belongs_to :associated_service
	
	def vendor
		associated_service.user
	end
end
