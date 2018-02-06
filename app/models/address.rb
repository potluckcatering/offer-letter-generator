class Address < ApplicationRecord
  belongs_to :employee

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    apt_number + " - " +  street_number + " " + street_address + ", " + city  + ", " + province + " " + postal_code  
  end  

  def full_address_letter
    apt_number + " - " +  street_number + " " + street_address + "<br>" + city  + ", " + province + "<br>" + postal_code  
  end  


end
