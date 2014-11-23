class Service < ActiveRecord::Base
  belongs_to :user


  def self.smartthings
  	Service.find_by_provider('smartthings')
  end 
  def self.wink
  	Service.find_by_provider('wink')
  end 
  def self.ubi
  	Service.find_by_provider('wink')
  end
end
