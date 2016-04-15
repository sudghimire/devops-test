class Flayer < ActiveRecord::Base
  attr_accessible :height, :path, :width
  
  # Associations
  belongs_to :event
end
