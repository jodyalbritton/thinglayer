module Stapi
	module Import
		def import
             
			 devices = switches.parsed_response + dimmers.parsed_response + contacts.parsed_response + motions.parsed_response + illuminants.parsed_response + temperatures.parsed_response + humidities.parsed_response + locks.parsed_response + batteries.parsed_response
           
             @user = User.find(@thing_user)
              devices.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save
			  end
			

		
			
		end 
	end
end
