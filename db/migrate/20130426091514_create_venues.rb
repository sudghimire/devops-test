class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :name
      t.string :telephone
      t.references :event

      t.timestamps
    end
  end
end
