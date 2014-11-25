class Admin::FaqsController < ApplicationController
  authorize_actions_for ApplicationAuthorizer
  before_action :set_faq, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @faqs = Faq.all
    respond_with([:admin, @faq])
  end

  def show
   respond_with([:admin, @faq])
  end

  def new
    @faq = Faq.new
    respond_with([:admin, @faq])
  end

  def edit
  end

  def create
    @faq = Faq.new(faq_params)
    flash[:notice] = 'Faq was successfully created.' if @faq.save
    respond_with([:admin, @faq])
  end

  def update
    flash[:notice] = 'Faq was successfully updated.' if @faq.update(faq_params)
    respond_with(@faq)
  end

  def destroy
    @faq.destroy
    respond_with([:admin, @faq])
  end

  private
    def set_faq
      @faq = Faq.find(params[:id])
    end

    def faq_params
      params.require(:faq).permit(:question, :answer)
    end
end
