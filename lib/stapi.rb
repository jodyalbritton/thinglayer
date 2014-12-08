module Stapi
	class << self
		FIELDS = [ :oauth_token, :thing_user ]
   		attr_accessor(*FIELDS)
		
   		require 'stapi/switches'
   		require 'stapi/dimmers'
   		require 'stapi/temperatures'
   		require 'stapi/motions'
         require 'stapi/powers'
         require 'stapi/energies'
         require 'stapi/contacts'
         require 'stapi/illuminants'
         require 'stapi/humidities'
         require 'stapi/locks'
         require 'stapi/batteries'
         require 'stapi/presence'
   		require 'stapi/import'
		   require 'stapi/client'


	end 
end