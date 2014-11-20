class GetLock	
	@queue = :locks_queue 
	def self.perform(device_id)
		device = Thing.find(device_id)
		device_event = device.lock_details.parsed_response
		base_uri = 'https://dazzling-heat-3134.firebaseio.com/'
		firebase = Firebase::Client.new(base_uri)
        firebase.push("events/"+device.uid+"/lock", {device: device_event["id"],  name: "lock", value: device_event["value"]})
	end
end