class AddPasswordDigestToRealtors < ActiveRecord::Migration[5.1]
  def up
    add_column :realtors, :password_digest, :string
    add_column :admins, :password_digest, :string
    add_column :house_hunters, :password_digest, :string
  end
  def down
    remove_column :realtors, :password_digest
    remove_column :admins, :password_digest
    remove_column :house_hunters, :password_digest
  end
end
