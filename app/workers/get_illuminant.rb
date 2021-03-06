class GetIlluminant
	@queue = :illuminants_queue 
	def self.perform(device_id)
		base_uri = ENV["FIREBASE_URL"]+"/" 
		firebase = Firebase::Client.new(base_uri)
		device = Thing.find(device_id)
		device_event = device.illuminant_details.parsed_response
		events = firebase.get("events/"+device.uid+"/illuminance", :orderBy => RC::Json.encode('$key'), :limitToLast => RC::Json.encode(1))
                if events.success? 
                    if events.response.body != "null"
                    	return nil
                    else
                    	firebase.push("events/"+device.uid+"/illuminance", {device: device_event["id"],  name: "illuminance", date: Time.now.to_time.iso8601.to_s, value: device_event["value"]})
                	end
                end
	end
end