class OmniauthCallbacksController < ApplicationController


  def create    
    @user = User.find(current_user) 
    @auth = request.env["omniauth.auth"]
    @provider = request.env["omniauth.provider"]
    @token = @auth.credentials.token
    @service = @user.services.find_or_initialize_by(provider: params[:provider])
    @service.name = params[:provider]
    @service.provider = params[:provider]
    @service.token = @token
    @service.save!
    redirect_to services_path
    
    
  end

end
