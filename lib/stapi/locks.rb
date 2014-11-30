module Stapi
	module Locks
		def locks
			@locks ||= HTTParty.get(url+'/locks?access_token='+connection) 
	    end 
	   
	    def show_lock(lock_id)
	    	@lock ||= HTTParty.get(url+'/locks/'+lock_id+'?access_token='+connection)
	    end
	    def lock_value(thing, value)
	    	if value == "off"
	    		@lock ||= url+'/locks/'+thing+'/unlock?access_token='+connection 
	    	else
	    		@lock ||= url+'/locks/'+thing+'/lock?access_token='+connection 
	    	end
	    	Rails.logger.debug(@lock)
	    	HTTParty.get(@lock)

	    end   
    end
end