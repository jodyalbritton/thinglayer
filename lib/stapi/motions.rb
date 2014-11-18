module Stapi
	module Motions
		def motions
			@motions ||= HTTParty.get(url+'/motions?access_token='+connection) 
	    end 
	   
	    def show_motion(motion_id)
	    	@motion ||= HTTParty.get(url+'/motions/'+motion_id+'?access_token='+connection)
	    end 
	   
    end
end