class Zone < ActiveRecord::Base
	belongs_to :location
	has_many :things, -> { order("position ASC") }


	# Zone averages 


	def average_temp
		things = self.things.where(:device_type => 'temperatureMeasurement')
		temps = 0

		things.each do |thing|
			temp = thing.events.where("STR_TO_DATE(date,'%m/%d%Y')" == Date.today).average(:value)
			unless temp == nil 
				temps = temp + temps
			end
		end 
		return temps
	end 


end
