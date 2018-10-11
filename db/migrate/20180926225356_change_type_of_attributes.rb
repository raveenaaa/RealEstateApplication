class ChangeTypeOfAttributes < ActiveRecord::Migration[5.1]
  def up
    #Company modifications
    change_column :companies, :size, :string
    change_column :companies, :year, :string
    change_column :companies, :revenue, :string

    #House modifications
    change_column :houses, :year, :string
    change_column :houses, :price, :string

    #House Hunter Modifications
    change_column :house_hunters, :phone, :string

    #Realtor Modifications
    change_column :realtors, :phone, :string

  end

  def down
    #Company rollback
    change_column :companies, :size, :integer
    change_column :companies, :year, :integer
    change_column :companies, :revenue, :integer

    #House rollback
    change_column :houses, :year, :integer
    change_column :houses, :price, :integer

    #House Hunter Rollback
    change_column :house_hunters, :phone, :integer

    #Realtor Rollback
    change_column :house_hunter, :phone, :integer
  end
end
