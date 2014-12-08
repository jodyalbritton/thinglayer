module Stapi
	module Powers
		def powers
			@powers ||= HTTParty.get(url+'/powers?access_token='+connection) 
	    end 
	   
	    def show_power(power_id)
	    	@powers ||= HTTParty.get(url+'/powers/'+power_id+'?access_token='+connection)
	    end 
	   
    end
end