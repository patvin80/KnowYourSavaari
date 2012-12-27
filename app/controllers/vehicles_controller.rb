class VehiclesController < ApplicationController
  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicle = Vehicle.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicles }
    end
  end

  # POST /vehicles/search
  # POST /vehicles.json
  def search
    @passedvehicle = Vehicle.new(params[:vehicle])
    @vehicle = Vehicle.find(:first, :conditions => [ "state_code = ? AND state_number = ? AND plate_number = ?  AND plate_letter = ?", @passedvehicle.state_code, @passedvehicle.state_number, @passedvehicle.plate_number, @passedvehicle.plate_letter])
    if (@vehicle.nil?)
      #render 'new'
      redirect_to :controller => "vehicles", :action => "new", notice: 'No Results'
    else
      respond_to do |format|
        format.html { redirect_to @vehicle, notice: 'Vehicle results'  }
        format.json { render json: @vehicle, status: :created, location: @vehicle }
      end
    end
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    #@vehicle = Vehicle.find(:first, :conditions => [ "state_code = ? AND state_number = ? AND plate_number = ?  AND plate_letter = ?", params[:state_code], params[:state_number], params[:plate_number], params[:plate_letter])
    @vehicle = Vehicle.find(params[:id])
    @yesCount = VehicleInspection.where(:vehicle_id => params[:id], :is_current => true ).count
    @noCount = VehicleInspection.where(:vehicle_id => params[:id], :is_current => false ).count

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.json
  def new
    if (params[:notice] == "No Results")
      @notice = "Your search did not give us any results. Please contribute to our database by filling the information below."
    end
    @vehicle = Vehicle.new()
    @vehicle.vehicle_inspections.new()
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    #@vehicle = Vehicle.where(params[:vehicle]).first
    @passedvehicle = Vehicle.new(params[:vehicle])
    #@vehicle = nil
    #@vehicle = Vehicle.joins(:vehicle_inspections).where(:state_code => params[:state_code], :state_number => params[:state_number], :plate_number => params[:plate_number], :plate_letter => params[:plate_letter]).first
    @vehicle = Vehicle.find(:first, :conditions => [ "state_code = ? AND state_number = ? AND plate_number = ?  AND plate_letter = ?", @passedvehicle.state_code, @passedvehicle.state_number, @passedvehicle.plate_number, @passedvehicle.plate_letter])
    if (@vehicle.nil?)
      @vehicle = Vehicle.new(params[:vehicle])
      @vehicle_inspection = @vehicle.vehicle_inspections.build(:is_current => !params[:is_current].nil?, :expiration_date => !params[:expiration_date].nil?, :inspection_agency => !params[:inspection_agency].nil? )
    else
      @vehicle_inspection = @vehicle.vehicle_inspections.build(:is_current => @passedvehicle.vehicle_inspections.first.is_current.nil?, :expiration_date => @passedvehicle.vehicle_inspections.first.expiration_date, :inspection_agency => @passedvehicle.vehicle_inspections.first.inspection_agency )
    end

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle created'  }
        format.json { render json: @vehicle, status: :created, location: @vehicle }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vehicles/1
  # PUT /vehicles/1.json
  def update
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
    end
  end
end
