class AddPasswordToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :password, :string
  end
end
