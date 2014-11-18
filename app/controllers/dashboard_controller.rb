class DashboardController < ApplicationController
  def index
  	@user = User.find(current_user)
    @grouped_things = @user.things.all.where.not(:zone_id => nil).group_by(&:device_type)
    @things = @user.things
  end

  def show
    if params[:query]
       @thing = Thing.where('label LIKE ?', '%'+params[:query]+'%')
       render json: @thing
        
    else 

    end 
  end
end
