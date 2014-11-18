module Stapi
	module Temperatures
		def temperatures
			@temperatures ||= HTTParty.get(url+'/temperatures?access_token='+connection) 
	    end 
	   
	    def show_temperature(temperature_id)
	    	@temperature ||= HTTParty.get(url+'/temperatures/'+temperature_id+'?access_token='+connection)
	    end 
	   
    end
end