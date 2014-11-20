class GetTemperature
	@queue = :temperatures_queue 
	def self.perform(device_id)
		device = Thing.find(device_id)
		device_event = device.temperature_details.parsed_response
		base_uri = 'https://dazzling-heat-3134.firebaseio.com/'
		firebase = Firebase::Client.new(base_uri)
        firebase.push("events/"+device.uid+"/temperature", {device: device_event["id"],  name: "temperature", value: device_event["value"]})
	end
end