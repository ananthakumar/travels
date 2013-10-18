class VehiclesController < ApplicationController
before_filter :authorize, only: [:index, :show, :edit, :update]
def new
  @vehicle = Vehicle.new
end
def create
     @agency = Agency.find(params[:agency_id])
   @vehicle = @agency.vehicles.create(params[:vehicle].permit(:name, :vmodel, :vno, :maxnopass,:noofvehicles,:description))
    redirect_to agency_path(@agency)
end
  def destroy
    @agency = Agency.find(params[:agency_id])
    @vehicle = @agency.vehicles.find(params[:id])
    @vehicle.destroy
    redirect_to agency_path(@agency)
  end

 
def index
  @vehicle = Vehicle.all
end

def show
@vehicle = Vehicle.find(params[:id])
end

private
    def vehicle_params
      params.require(:vehicle).permit(:name, :vmodel, :vno, :maxnopass,:noofvehicles,:description)
    end  
end
