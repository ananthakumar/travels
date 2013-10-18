class Customer < ActiveRecord::Base
	 validates_presence_of :name, :address, :password, :cpasswd, :email, :phno
	 validates_numericality_of :phno, :allow_nil => true
	
 belongs_to :vehicle
	
	
end
