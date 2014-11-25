class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  respond_to :html



  def new
    @message = Message.new
    respond_with(@message)
  end


  def create
    @message = Message.new(message_params)
    flash[:notice] = 'Message was successfully created.' if @message.save
    redirect_to(page_path('help'))
  end


  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:user_id, :subject, :body)
    end
end
