class Location < ActiveRecord::Base
	has_many :zones
	belongs_to :user
end
