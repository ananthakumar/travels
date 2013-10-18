class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.string :passwd
      t.string :cpasswd
      t.string :email
      t.integer :phno

      t.timestamps
    end
  end
end
