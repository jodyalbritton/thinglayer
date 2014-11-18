module Stapi
	module Humidities
		def humidities
			@humidities ||= HTTParty.get(url+'/humidities?access_token='+connection) 
	    end 
	   
	    def show_humidity(humidity_id)
	    	@humidity ||= HTTParty.get(url+'/humidities/'+humidity_id+'?access_token='+connection)
	    end 
	   
    end
end