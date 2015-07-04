class User < ActiveRecord::Base 
  include Authority::UserAbilities
  rolify
  require 'stapi'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :authentication_keys => [:login]

   attr_accessor :login

  has_many :services, dependent: :destroy
  has_many :things, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :zones, through: :locations

  validates :username,
  :uniqueness => {
    :case_sensitive => false
  }

def st_token
  @token ||=  self.services.find_by(provider: 'smartthings')
end 
def smartthings
	Stapi::Client.new(:oauth_token => self.st_token.token, :thing_user => self.id)
end 


def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end


end
