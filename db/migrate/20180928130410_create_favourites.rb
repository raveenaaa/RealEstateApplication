class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.references :house_hunter
      t.references :house
      t.timestamps
    end
  end
end
