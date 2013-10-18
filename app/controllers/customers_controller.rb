class CustomersController < ApplicationController
  before_filter :authorize, only: [:index, :show, :edit, :update]
  def new
  @customer = Customer.new
end
 
def create
  @customer = Customer.new(params[:customer].permit(:name, :address, :password, :cpasswd, :email, :phno))
 
 
  if @customer.save
    flash[:notice] = "You Signed up successfully"
    session[:customer_id] = @customer.id
    #redirect_to @customer
    ssa=(session[:customer_id])
   redirect_to :controller=>'customers', :action => 'show', :id => ssa
  else
    render 'new'
  end
end

  def show
    @customer = Customer.find(params[:id])
  end

def edit
  @customer = Customer.find(params[:id])
end



def update
  @customer = Customer.find(params[:id])
 
  if @customer.update(params[:customer].permit(:name, :address, :password, :cpasswd, :email, :phno))
   # redirect_to @customer
    ssab=(session[:customer_id])
   redirect_to :controller=>'customers', :action => 'show', :id => ssab
  else
    render 'edit'
  end
end

def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy
 
  redirect_to root_path

end


def index
  @customer = Customer.all
end



  private
    def customer_params
      params.require(:customer).permit(:name, :address, :password, :cpasswd, :email, :phno)
    end           
end
