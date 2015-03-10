class ServicesController < ApplicationController
	before_filter :authenticate_user!
	def index
		if user_signed_in?
			@user = current_user
		    @services = @user.services
		else
		    @user = nil
		end
	end

	def destroy
		@service = Service.find(params[:id])
	    @service.destroy
	    respond_to do |format|
	      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end
end 