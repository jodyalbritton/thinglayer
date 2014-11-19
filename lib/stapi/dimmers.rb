module Stapi
	module Dimmers
		def dimmers
			@dimmers ||= HTTParty.get(url+'/dimmers?access_token='+connection) 
	    end 
	    def show_dimmer(dimmer_id)
	    	@dimmer ||= HTTParty.get(url+'/dimmers/'+dimmer_id+'?access_token='+connection)
	    end

	    def dimmer_level(thing, level)
	    	@dimmer ||= url+'/switches/'+thing+'/level/'+level+'?access_token='+connection 
	    	Rails.logger.debug(@dimmer)
	    	HTTParty.get(@dimmer)

	    end

	   
	end
end
