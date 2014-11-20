class GetContact
	@queue = :contacts_queue 
	def self.perform(device_id)
		device = Thing.find(device_id)
		device_event = device.contact_details.parsed_response
		base_uri = 'https://dazzling-heat-3134.firebaseio.com/'
		firebase = Firebase::Client.new(base_uri)
        firebase.push("events/"+device.uid+"/contact", {device: device_event["id"],  name: "contact", value: device_event["value"]})
	end
end