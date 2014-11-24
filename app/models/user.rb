class User < ActiveRecord::Base 
  rolify
  require 'stapi'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :services
  has_many :things
  has_many :locations
  has_many :zones, through: :locations

def st_token
  @token ||=  self.services.find_by(provider: 'smartthings')
end 
def smartthings
	Stapi::Client.new(:oauth_token => self.st_token.token, :thing_user => self.id)
end 



end
