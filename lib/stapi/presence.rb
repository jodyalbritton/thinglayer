module Stapi
	module Presence
		def presence
			@presences ||= HTTParty.get(url+'/presence?access_token='+connection) 
	    end 
	   
	    def show_presence(presence_id)
	    	@presence ||= HTTParty.get(url+'/presence/'+presence_id+'?access_token='+connection)
	    end 
	   
    end
end