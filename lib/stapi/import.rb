module Stapi
	module Import
		def import
             

             switch_devices = switches.parsed_response 
             @user = User.find(@thing_user)
             switch_devices.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save
			end
			dimmer_devices = dimmers.parsed_response 
            @user = User.find(@thing_user)
            dimmer_devices.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save
			end

			temp_devices = temperatures.parsed_response 
            @user = User.find(@thing_user)
            temp_devices.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end
			hum_devices = humidities.parsed_response 
            @user = User.find(@thing_user)
            hum_devices.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end
			
			mot_devices = motions.parsed_response 
            @user = User.find(@thing_user)
            mot_devices.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end

			conts = contacts.parsed_response 
            @user = User.find(@thing_user)
            conts.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end

			illums = illuminants.parsed_response 
            @user = User.find(@thing_user)
            illums.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end

			lock_devices = locks.parsed_response 
            @user = User.find(@thing_user)
            lock_devices.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
			        stuff.uid = it["id"]
					stuff.device_type = it["type"]
					stuff.label = it["name"]
					stuff.provider = "smartthings"
					stuff.user = @user
					stuff.save!
			end

			bats = batteries.parsed_response 
            @user = User.find(@thing_user)
            bats.each do |it|
        
			        stuff = Thing.find_or_initialize_by(device_type: it["type"], uid: it["id"])
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
