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



def name
  return "#{first_name} #{last_name}"
end
end

 