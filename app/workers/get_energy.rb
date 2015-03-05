class GetPower
	@queue = :energys_queue 
	def self.perform(device_id)
		base_uri = '<%= ENV["FIREBASE_URL"] %>/'
		firebase = Firebase::Client.new(base_uri)
		device = Thing.find(device_id)
		device_event = device.energy_details.parsed_response
		events = firebase.get("events/"+device.uid+"/energy",  :orderBy => RC::Json.encode('$key'), :limitToLast => RC::Json.encode(1))
                if events.success? 
                    if events.response.body != "null"
                    	return nil
                    else
                    	firebase.push("events/"+device.uid+"/energy", {device: device_event["id"],  name: device_event["type"], date: Time.now.to_time.iso8601, value: device_event["value"]})
                	end
                end
	end
end