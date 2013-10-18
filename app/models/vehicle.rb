class Vehicle < ActiveRecord::Base
	
  belongs_to :agency
   validates_presence_of :name, :vmodel, :vno, :maxnopass,:noofvehicles,:description
	 validates_numericality_of :maxnopass, :noofvehicles, :allow_nil => true


def days

   

    end



def rate



    end
   
end
