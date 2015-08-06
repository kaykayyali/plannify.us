class Event < ActiveRecord::Base

	belongs_to :user
	has_many :associated_services, through: :confirmed_services
	has_many :comments
	has_many :confirmed_services
  after_initialize :init	
	validates :start_date, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :guestcount, presence: true

  def init
     self.confirmed  ||= false           #will set the default value only if it's nil
  end
  
end
 