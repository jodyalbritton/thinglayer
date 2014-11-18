class Zone < ActiveRecord::Base
	belongs_to :location
	has_many :things, -> { order("position ASC") }

end
