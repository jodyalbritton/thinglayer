module Stapi
	module Import
		def import
             swits = switches.parsed_response
			 dims = dimmers.parsed_response 
			 conts = contacts.parsed_response  
			 mots = motions.parsed_response 
			 illums = illuminants.parsed_response 
			 temps = temperatures.parsed_response 
			 hums = humidities.parsed_response 
			 locs = locks.parsed_response 
			 bats = batteries.parsed_response


			

             unless locs == nil 
             @user = User.find(@thing_user)
             devices = locs 
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
			unless dims == nil 
             @user = User.find(@thing_user)
             devices = dims 
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
			unless swits == nil 
             @user = User.find(@thing_user)
             devices = swits 
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
			unless temps == nil 
             @user = User.find(@thing_user)
             devices = temps 
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
			unless hums == nil 
             @user = User.find(@thing_user)
             devices = hums 
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
			unless bats == nil 
             @user = User.find(@thing_user)
             devices = bats 
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
			
			unless conts == nil 
             @user = User.find(@thing_user)
             devices = conts 
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
			unless illums == nil 
             @user = User.find(@thing_user)
             devices = illums 
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
			unless mots == nil 
             @user = User.find(@thing_user)
             devices = mots 
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
end
