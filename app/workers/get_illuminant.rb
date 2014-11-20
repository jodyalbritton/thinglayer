class GetIlluminant
	@queue = :illuminants_queue 
	def self.perform(device_id)
		device = Thing.find(device_id)
		device_event = device.illuminant_details.parsed_response
		base_uri = 'https://dazzling-heat-3134.firebaseio.com/'
		firebase = Firebase::Client.new(base_uri)
        firebase.push("events/"+device.uid+"/illuminance", {device: device_event["id"],  name: "illuminance", value: device_event["value"]})
	end
end