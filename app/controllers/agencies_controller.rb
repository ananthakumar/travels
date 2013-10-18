class AgenciesController < ApplicationController
   before_filter :authorize, only: [:index, :show, :edit, :update]
   def new
  @agency = Agency.new
end
 
def create
  @agency = Agency.new(params[:agency].permit(:name, :address, :password, :cpasswd, :email, :phno))
 
 
  if @agency.save
    session[:agency_id] = @agency.id
    flash[:notice] = "You Signed up successfully"
    #  redirect_to root_url, notice: "Thank you for signing up!"
    sss=(session[:agency_id])
   redirect_to :controller=>'agencies', :action => 'show', :id => sss
    else
    render 'new'
  end
end

  def show
    @agency = Agency.find(params[:id])
  end

def edit
  @agency = Agency.find(params[:id])
end



def update
  @agency = Agency.find(params[:id])
 
  if @agency.update(params[:agency].permit(:name, :address, :password, :cpasswd, :email, :phno))
   # redirect_to @agency
   ssss=(session[:agency_id])
   redirect_to :controller=>'agencies', :action => 'show', :id => ssss
  else
    render 'edit'
  end
end

def destroy
  @agency = Agency.find(params[:id])
  @agency.destroy
 
  redirect_to root_path
end


def index
  @agencies = Agency.all
end



  private
    def agency_params
      params.require(:agency).permit(:name, :address, :password, :cpasswd, :email, :phno)
    end           
end
