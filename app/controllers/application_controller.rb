class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
private
   def current_agency
      if Agency.find_by_id(session[:agency_id])
    @current_agency ||= Agency.find(session[:agency_id]) if session[:agency_id]
       end
   end

   def current_customer
    if Customer.find_by_id(session[:customer_id])
    @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
    end
    end


  helper_method :current_agency
  helper_method :current_customer

  def authorize
    
     redirect_to login_url, alert: "Not authorized" if current_agency.nil? && current_customer.nil?

end
     
end
