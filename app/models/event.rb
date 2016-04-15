class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :price

  # Associations
  has_one   :venue
  has_one   :contact
  has_many  :flayers
end
