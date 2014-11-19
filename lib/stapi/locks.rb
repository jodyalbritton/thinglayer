module Stapi
	module Locks
		def locks
			@locks ||= HTTParty.get(url+'/locks?access_token='+connection) 
	    end 
	   
	    def show_lock(lock_id)
	    	@lock ||= HTTParty.get(url+'/locks/'+lock_id+'?access_token='+connection)
	    end 
	   
    end
end