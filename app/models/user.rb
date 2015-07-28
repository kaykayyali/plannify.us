class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :role , :presence => true
    has_many :events
    has_many :services, :through => :associated_services
	has_many :associated_services
end

 