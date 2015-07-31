class ConfirmedService < ActiveRecord::Base
	belongs_to :event
	belongs_to :associated_service
end
