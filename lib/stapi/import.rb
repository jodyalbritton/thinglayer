module Stapi
	module Import
		def import
             

             items = switches.parsed_response 
             @user = User.find(@thing_user)
             items.each do |it|
        
			        stuff = Thing.where("device_type = ?  AND  uid = ? ", it["type"], it["id"]).first_or_initialize
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end

			items = temperatures.parsed_response 
            @user = User.find(@thing_user)
            items.each do |it|
        
			        stuff = Thing.where("device_type = ?  AND  uid = ? ", it["type"], it["id"]).first_or_initialize
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end
			items = humidities.parsed_response 
            @user = User.find(@thing_user)
            items.each do |it|
        
			        stuff = Thing.where("device_type = ?  AND  uid = ? ", it["type"], it["id"]).first_or_initialize
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end
			items = dimmers.parsed_response 
            @user = User.find(@thing_user)
            items.each do |dimmer|
        
			        stuff = Thing.where("device_type = ?  AND  uid = ? ", "dimmer", dimmer["id"]).first_or_initialize
			        stuff.uid = dimmer["id"]
					stuff.device_type = "dimmer"
					stuff.label = dimmer["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end
			items = motions.parsed_response 
            @user = User.find(@thing_user)
            items.each do |it|
        
			        stuff = Thing.where("device_type = ?  AND  uid = ? ", it["type"], it["id"]).first_or_initialize
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end

			items = contacts.parsed_response 
            @user = User.find(@thing_user)
            items.each do |it|
        
			        stuff = Thing.where("device_type = ?  AND  uid = ? ", it["type"], it["id"]).first_or_initialize
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end

			items = illuminants.parsed_response 
            @user = User.find(@thing_user)
            items.each do |it|
        
			        stuff = Thing.where("device_type = ?  AND  uid = ? ", it["type"], it["id"]).first_or_initialize
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end

		
			
		end 
	end
end
