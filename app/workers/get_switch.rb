class GetSwitch
	@queue = :switches_queue 
	def self.perform(device_id)
		base_uri = 'https://dazzling-heat-3134.firebaseio.com/'
		firebase = Firebase::Client.new(base_uri)
		device = Thing.find(device_id)
		device_event = device.switch_details.parsed_response
		events = firebase.get("events/"+device.uid+"/switch")
                if events.success? 
                    if events.response.body != "null"
                    	return nil
                    else
                    	firebase.push("events/"+device.uid+"/switch", {device: device_event["id"],  name: "switch", value: device_event["value"]})
                	end
                end
	end
end