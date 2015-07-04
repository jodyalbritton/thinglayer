class ZonesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_zone, only: [:show, :edit, :update, :destroy]

  # GET /zones
  # GET /zones.json
  def index
    @location = Location.find(params[:location_id])
    @zones = @location.zones.all 
    
  end

  # GET /zones/1
  # GET /zones/1.json
  def show

    @user = User.find(@zone.location.user)
    #@st_dimmers = @user.smartthings.dimmers.index_by {|device| device["id"]}
    
    @things = @zone.things.where(:visible => true).order(:position)
  end

  # GET /zones/new
  def new
    @location = Location.find(params[:location_id])
    @zone = @location.zones.new
  end

  # GET /zones/1/edit
  def edit
  end

  # POST /zones
  # POST /zones.json
  def create
   @location = Location.find(params[:location_id])
   @zone = @location.zones.new(zone_params)

    respond_to do |format|
      if @zone.save
        format.html { redirect_to [@location, @zone], notice: 'Zone was successfully created.' }
        format.json { render :show, status: :created, location: @zone }
      else
        format.html { render :new }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zones/1
  # PATCH/PUT /zones/1.json
  def update
    respond_to do |format|
      if @zone.update(zone_params)
        format.html { redirect_to [@location, @zone], notice: 'Zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @zone }
      else
        format.html { render :edit }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  def sort
    params[:thing].each_with_index do |id, index|
     Thing.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end

  # DELETE /zones/1
  # DELETE /zones/1.json
  def destroy
    @zone.destroy
    respond_to do |format|
      format.html { redirect_to location_zones_path(@location), notice: 'Zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @location = Location.find(params[:location_id])
      @zone = @location.zones.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zone_params
      params.require(:zone).permit(:name, :ancestry, :description)
    end
end
