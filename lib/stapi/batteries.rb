module Stapi
	module Batteries
		def batteries
			@batteries ||= HTTParty.get(url+'/batteries?access_token='+connection) 
	    end 
	   
	    def show_battery(battery_id)
	    	@battery ||= HTTParty.get(url+'/batteries/'+battery_id+'?access_token='+connection)
	    end 
	   
    end
end