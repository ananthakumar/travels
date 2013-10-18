class SessionsController < ApplicationController
    def new
  end
   
   def create
    agency = Agency.find_by_email(params[:email])
    
    if agency &&  Agency.find_by_password(params[:password])
      session[:agency_id] = agency.id
      #redirect_to root_url, notice: "Logged in!"
        ss=(session[:agency_id])
     # redirect_to show_agencies_path(agency.id)
      redirect_to :controller=>'agencies', :action => 'show', :id => ss

elsif customer = Customer.find_by_email(params[:email])

  if customer &&  Customer.find_by_password(params[:password])
      session[:customer_id] = customer.id
     # redirect_to root_url, notice: "Logged in!"
ss=(session[:customer_id])
  #    redirect_to show_agencies_path(agency.id)
      redirect_to :controller=>'customers', :action => 'show', :id => ss
    end
    
   else
      flash.now.alert = "Email or password is invalid"
      render "new"

    end
  end
  

  def destroy
    session[:agency_id] = nil
    session[:customer_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end


end