class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :events
  has_many :services, :through => :associated_services
	has_many :associated_services
	has_many :comments
	has_many :messages_from, :foreign_key => :from_id, class_name: 'Message'
	has_many :messages_to, :foreign_key => :to_id, class_name: 'Message'
  has_one :profile
  validates :role , :presence => true
  validates :first_name, presence: true
  validates :last_name, presence: true


def events_scheduled(cur_id)
  events_confirmed = []
  Event.all.each do |event|
    event.confirmed_services.each do |confirmed_service|
      if confirmed_service.vendor.id == 2 && event.confirmed == true
        p 'confirmed'
        events_confirmed.push(event)
      end
    end
  end
    events_confirmed
end
def name
  return "#{first_name} #{last_name}"
end
end

 