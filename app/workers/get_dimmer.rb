class GetDimmer
	@queue = :dimmers_queue 
	def self.perform(device_id)
		base_uri = ENV["FIREBASE_URL"]+"/" 
		firebase = Firebase::Client.new(base_uri)
		device = Thing.find(device_id)
		device_event = device.dimmer_details.parsed_response
		events = firebase.get("events/"+device.uid+"/level", :orderBy => RC::Json.encode('$key'), :limitToLast => RC::Json.encode(1))
                if events.success? 
                    if events.response.body != "null"
                    	return nil
                    else
                    	firebase.push("events/"+device.uid+"/level", {device: device_event["id"],  name: "level", date: Time.now.to_time.iso8601.to_s, value: device_event["value"]})
                	end
                end
	end
end