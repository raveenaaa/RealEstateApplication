class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :location
      t.string :area
      t.integer :year
      t.string :style
      t.integer :price
      t.integer :floors
      t.string :basement
      t.string :owner
      t.integer :realtor_contact
      t.string :buyers
      t.references :company
      t.timestamps
    end
  end
end
