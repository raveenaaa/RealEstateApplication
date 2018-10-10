class AddNameToHouses < ActiveRecord::Migration[5.1]
  def change
    add_column :houses, :name, :string
  end
end
