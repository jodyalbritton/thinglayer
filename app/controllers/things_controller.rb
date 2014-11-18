class ThingsController < ApplicationController
	def index
		@user = User.find(current_user)
		@things = @user.things 
	end 

	def show
		@user = User.find(current_user)
		@thing = @user.things.find(params[:id])
	end

    def edit
    	@user = User.find(current_user)
		@thing = @user.things.find(params[:id])
    end

	def update
		@user = User.find(current_user)
		@thing = @user.things.find(params[:id])

			if params[:thing][:source]
				
    			if params[:thing][:source] == "remote"
					if @thing.device_type == "switch" 
						if @thing.device_value != params[:thing][:switch_value]
	    					@user.smartthings.switch_value(@thing.uid, params[:thing][:switch_value])
	    				end
	    			elsif @thing.device_type == "dimmer"
	    				if @thing.device_value != params[:thing][:dimmer_value]
	        				@user.smartthings.dimmer_level(@thing.uid, params[:thing][:dimmer_value])
	        			end
	    			end
			    end 
			        
	        else 
	        	respond_to do |format|
		      	if @thing.update(thing_params)
		        format.html { redirect_to things_path, notice: 'Thing was successfully created.' }
		        format.json { render :show, status: :created, location: @thing }
		   
		      	else
		        format.html { render :new }
		        format.json { render json: @thing, status: :unprocessable_entity }
      			end
     		end 

  

    		
	        end
			 

		

	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @user = User.find(current_user)
      @thing = @user.things.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thing_params
      params.require(:thing).permit(:name, :label, :description, :visible, :zone_id, :switch_value, :switch_type, :dimmer_value, :position)
    end
end