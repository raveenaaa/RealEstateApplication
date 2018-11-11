class AddRealtorToHouses < ActiveRecord::Migration[5.1]
  def change
    add_reference :houses, :realtor, foreign_key: true
    remove_column :houses, :realtor_contact
  end
end
