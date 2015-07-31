class Event < ActiveRecord::Base

	belongs_to :user
	has_many :associated_services, through: :confirmed_services
	has_many :comments
	has_many :confirmed_services
end
 