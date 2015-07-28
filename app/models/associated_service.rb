class AssociatedService < ActiveRecord::Base
	belongs_to :vendor
	belongs_to :service
end
