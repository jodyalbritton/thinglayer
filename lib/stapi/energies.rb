module Stapi
	module Energies
		def energies
			@energies ||= HTTParty.get(url+'/energies?access_token='+connection) 
	    end 
	   
	    def show_energy(energy_id)
	    	@energies ||= HTTParty.get(url+'/energies/'+energy_id+'?access_token='+connection)
	    end 
	   
    end
end