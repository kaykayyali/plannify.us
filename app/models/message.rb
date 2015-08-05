class Message < ActiveRecord::Base
	belongs_to :from, :class_name => "User"
	belongs_to :to, :class_name => "User"


	scope :unread, -> {where(read: false) }

end
