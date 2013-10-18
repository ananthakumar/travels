class Agency < ActiveRecord::Base
	
	 has_many :vehicles, dependent: :destroy
	 validates_presence_of :name, :address, :password, :cpasswd, :email, :phno
	 validates_numericality_of :phno, :allow_nil => true
	





end
