object @event

attributes :id, :name, :date, :description, :price
child(:venue) { attributes :address_1, :address_2, :city, :name, :state, :telephone, :zip_code }
child(:contact) { attributes :email, :telephone }
child(:flayers) { attributes :height, :path, :width }



