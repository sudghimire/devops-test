class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :telephone
      t.references :event

      t.timestamps
    end
  end
end
