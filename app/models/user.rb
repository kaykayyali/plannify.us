class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
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

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    # user.image = auth.info.image # assuming the user model has an image
  end
end
def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
end
  def name
    return "#{first_name} #{last_name}"
  end

end

 