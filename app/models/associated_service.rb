class AssociatedService < ActiveRecord::Base
	belongs_to :user
	belongs_to :service
	has_many :confirmed_services
end
