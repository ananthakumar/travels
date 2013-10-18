class RemovePasswdFromAgencies < ActiveRecord::Migration
  def change
  	 remove_column :agencies, :passwd, :string
  end
end
