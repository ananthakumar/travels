class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :vmodel
      t.string :vno
      t.integer :maxnopass
      t.integer :noofvehicles
      t.text :description
      t.references :agency, index: true

      t.timestamps
    end
  end
end
