class RemovePasswordFromRealtors < ActiveRecord::Migration[5.1]
  def change
    remove_column :realtors, :password
    remove_column :house_hunters, :password
    remove_column :admins, :password
  end
end
