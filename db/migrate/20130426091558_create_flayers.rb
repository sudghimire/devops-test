class CreateFlayers < ActiveRecord::Migration
  def change
    create_table :flayers do |t|
      t.string :path
      t.string :height
      t.string :width
      t.references :event

      t.timestamps
    end
  end
end
