class Service < ActiveRecord::Base
  belongs_to :user


  def self.smartthings
  	Service.find_by_provider('smartthings')
  end 
end
