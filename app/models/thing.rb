class Thing < ActiveRecord::Base
	belongs_to :user
    belongs_to :zone
    
     acts_as_list :scope => :zone
    
    
    def switch_details
        @user ||= User.find(user_id)
        @user.smartthings.show_switch(self.uid)
    end

    def dimmer_details
        @user ||= User.find(user_id)
        @user.smartthings.show_dimmer(self.uid)
    end

     def motion_details
        @user ||= User.find(user_id)
        @user.smartthings.show_motion(self.uid)
     end  
    
    def device_value 
        
            base_uri = 'https://dazzling-heat-3134.firebaseio.com/'
            if self.device_type == "dimmer"
                firebase = Firebase::Client.new(base_uri)
                events = firebase.get("events/"+self.uid+"/level")
            elsif self.device_type == "temperatureMeasurement" 
                firebase = Firebase::Client.new(base_uri)
                events = firebase.get("events/"+self.uid+"/temperature")
            elsif self.device_type == "motion" 
                firebase = Firebase::Client.new(base_uri)
                events = firebase.get("events/"+self.uid+"/motion")
            elsif self.device_type == "contact" 
                firebase = Firebase::Client.new(base_uri)
                events = firebase.get("events/"+self.uid+"/contact")
            elsif self.device_type == "switch" 
                firebase = Firebase::Client.new(base_uri)
                events = firebase.get("events/"+self.uid+"/switch")
            elsif self.device_type == "illuminant" 
                firebase = Firebase::Client.new(base_uri)
                events = firebase.get("events/"+self.uid+"/illuminance")
           
            end
        
   

        event =  JSON.parse(events.response.response_body).to_a
        event.last.second["value"]

    end






    def switch_value
        self.switch_details.parsed_response["value"]
    end

    def dimmer_value
        self.dimmer_details.parsed_response["value"]
    end

    def motion_value
        self.motion_details.parsed_response["value"]
    end

    def dimmer_value=(val)
        @dimmer_value = val
    end 
end
