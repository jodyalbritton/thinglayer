module Stapi
	module Illuminants
		def illuminants
			@illuminants ||= HTTParty.get(url+'/illuminants?access_token='+connection) 
	    end 
	   
	    def show_illuminant(illuminant_id)
	    	@illuminants ||= HTTParty.get(url+'/illuminants/'+illuminant_id+'?access_token='+connection)
	    end 
	   
    end
end