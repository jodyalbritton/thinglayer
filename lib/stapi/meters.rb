module Stapi
	module Meters
		def meters
			@meters ||= HTTParty.get(url+'/meters?access_token='+connection) 
	    end 
	   
	    def show_meter(meter_id)
	    	@meter ||= HTTParty.get(url+'/meters/'+meter_id+'?access_token='+connection)
	    end 
	   
    end
end