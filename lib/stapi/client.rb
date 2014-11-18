require 'forwardable'
module Stapi
	class Client
		extend Forwardable
		include Switches
		include Dimmers
		include Temperatures
		include Motions
		include Contacts
		include Illuminants
		include Humidities
		include Import
		attr_reader :oauth_token, :thing_user

		def initialize(options={})
			@oauth_token = options[:oauth_token]
			@thing_user = options[:thing_user]
	    end 

		def api_url
   			"http://graph.api.smartthings.com"
   		end

   		def connection
   			params = {}
   			params[:oauth_token] = @oauth_token if @oauth_token
   			
   		end 

   		

   		def url
   			@response = HTTParty.get('http://graph.api.smartthings.com/api/smartapps/endpoints/'+ENV['ST_CLIENT_ID']+'?access_token='+self.oauth_token)
			@parsed ||= @response.parsed_response
		  	@url ||= api_url + @parsed[0]["url"] 
   		end

   		def token
   			options[:token]
   		end 

	end
end