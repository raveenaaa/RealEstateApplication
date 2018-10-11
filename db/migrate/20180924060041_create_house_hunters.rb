class CreateHouseHunters < ActiveRecord::Migration[5.1]
  def change
    create_table :house_hunters do |t|
      t.string :email
      t.string :password
      t.string :name
      t.integer :phone
      t.string :preferred

      t.timestamps
    end
  end
end
