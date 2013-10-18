class RemovePasswdFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :passwd, :string
  end
end
