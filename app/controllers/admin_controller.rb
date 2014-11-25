class AdminController < ApplicationController
  before_filter :authenticate_user!
  authorize_actions_for ApplicationAuthorizer

  def index
  end

  
end