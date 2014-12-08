class Thing < ActiveRecord::Base
	belongs_to :user
    belongs_to :zone
    has_many :events
    
    acts_as_list :scope => :zone
    
    def switch_value 
    end
    def lock_value
    end
    def dimmer_value
    end    
    
    def switch_details
        @user ||= User.find(user_id)
        @user.smartthings.show_switch(self.uid)
    end

    def contact_details
        @user ||= User.find(user_id)
        @user.smartthings.show_contact(self.uid)
    end

    def power_details
        @user ||= User.find(user_id)
        @user.smartthings.show_power(self.uid)
    end

    def energy_details
        @user ||= User.find(user_id)
        @user.smartthings.show_energy(self.uid)
    end

    def presence_details
        @user ||= User.find(user_id)
        @user.smartthings.show_presence(self.uid)
    end

    def dimmer_details
        @user ||= User.find(user_id)
        @user.smartthings.show_dimmer(self.uid)
    end


     def motion_details
        @user ||= User.find(user_id)
        @user.smartthings.show_motion(self.uid)
    end
    def motion_events
        @user ||= User.find(user_id)
        @user.smartthings.motion_events(self.uid)
    end
    def lock_details
        @user ||= User.find(user_id)
        @user.smartthings.show_lock(self.uid)
    end 
    def illuminant_details
        @user ||= User.find(user_id)
        @user.smartthings.show_illuminant(self.uid)
    end 

    def battery_details
        @user ||= User.find(user_id)
        @user.smartthings.show_battery(self.uid)
    end 
    def temperature_details
        @user ||= User.find(user_id)
        @user.smartthings.show_temperature(self.uid)
    end
    def humidity_details
        @user ||= User.find(user_id)
        @user.smartthings.show_humidity(self.uid)
    end
    def  lock_details
        @user ||= User.find(user_id)
        @user.smartthings.show_lock(self.uid)
    end
      
    
    def device_value        
           if self.device_type == "dimmer"
                Resque.enqueue(GetDimmer, self.id)
                return nil
            elsif self.device_type == "temperatureMeasurement" 
                Resque.enqueue(GetTemperature, self.id)
                return nil 
            elsif self.device_type == "relativeHumidityMeasurement" 
                Resque.enqueue(GetHumidity, self.id)
                return nil
            elsif self.device_type == "motion" 
                Resque.enqueue(GetMotion, self.id)
                return nil
            elsif self.device_type == "contact" 
                Resque.enqueue(GetContact, self.id)
                return nil
            elsif self.device_type == "lock" 
                Resque.enqueue(GetLock, self.id)
                return nil
            elsif self.device_type == "battery" 
                Resque.enqueue(GetBattery, self.id)
                return nil
            elsif self.device_type == "switch" 
                Resque.enqueue(GetSwitch, self.id)
                return nil
            elsif self.device_type == "illuminant" 
                Resque.enqueue(GetIlluminant, self.id)
                return nil
            end
    end

    def display_type
        if self.device_type == "relativeHumidityMeasurement" 
            return "Humidity"
        elsif self.device_type == "temperatureMeasurement"
            return "Temperature"
        elsif self.device_type == "contact"
            return "Contact"
        elsif self.device_type == "illuminant"
            return "Illuminance"
        elsif self.device_type == "battery"
            return "Battery"
        elsif self.device_type == "lock"
            return "Lock"
        elsif self.device_type == "switch"
            return "Switch"
        elsif self.device_type == "dimmer"
            return "Dimmer"
        elsif self.device_type == "motion"
            return "Motion"
        end
            
    end
end
