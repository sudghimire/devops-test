class Venue < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :city, :name, :state, :telephone, :zip_code

  # Associations
  belongs_to :event
end
