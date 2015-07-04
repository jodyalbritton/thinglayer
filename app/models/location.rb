class Location < ActiveRecord::Base
	has_many :zones, dependent: :destroy
	belongs_to :user
	
end
