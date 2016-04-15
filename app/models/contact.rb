class Contact < ActiveRecord::Base
  attr_accessible :email, :telephone

  # Associations
  belongs_to :event
end
