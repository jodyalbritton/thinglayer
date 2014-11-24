module Stapi
	module Switches
		def switches
			@switches ||= HTTParty.get(url+'/switches?access_token='+connection) 
	    end 
	   
	    def show_switch(switch_id)
	    	@switch ||= HTTParty.get(url+'/switches/'+switch_id+'?access_token='+connection)
	    end 
	    
	     def switch_value(thing, value)
	    	@switch ||= url+'/switches/'+thing+'/'+value+'?access_token='+connection 
	    	Rails.logger.debug(@dimmer)
	    	HTTParty.get(@switch)

	    end

	    def switch_events(switch_id)
	    	@switch ||= HTTParty.get(url+'/switches/'+switch_id+'/events?access_token='+connection)
	    end 

    end
end