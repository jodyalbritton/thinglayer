module Stapi
	module Contacts
		def contacts
			@contacts ||= HTTParty.get(url+'/contacts?access_token='+connection) 
	    end 
	   
	    def show_contact(contact_id)
	    	@contact ||= HTTParty.get(url+'/contacts/'+contact_id+'?access_token='+connection)
	    end 
	   
    end
end