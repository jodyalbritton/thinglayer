class Admin::UsersController < ApplicationController
  authorize_actions_for ApplicationAuthorizer
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.all
    respond_with([:admin, @user])
  end

  def show
   respond_with([:admin, @user])
  end

  def new
    @user = User.new
    respond_with([:admin, @user])
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    flash[:notice] = 'User was successfully created.' if @user.save
    respond_with([:admin, @user])
  end

  def update
    flash[:notice] = 'User was successfully updated.' if @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with([:admin, @user])
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:question, :answer)
    end
end
