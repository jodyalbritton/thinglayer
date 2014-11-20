class GetHumidity
	@queue = :humidities_queue 
	def self.perform(device_id)
		device = Thing.find(device_id)
		device_event = device.humidity_details.parsed_response
		base_uri = 'https://dazzling-heat-3134.firebaseio.com/'
		firebase = Firebase::Client.new(base_uri)
        firebase.push("events/"+device.uid+"/humidity", {device: device_event["id"],  name: "humidity", value: device_event["value"]})
	end
end