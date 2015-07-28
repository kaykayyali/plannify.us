class Service < ActiveRecord::Base
	has_many :vendors, :through => :associated_services
	has_many :associated_services
	has_and_belongs_to_many :events
end
 