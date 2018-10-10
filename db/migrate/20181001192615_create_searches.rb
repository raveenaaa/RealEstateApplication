class CreateSearches < ActiveRecord::Migration[5.1]
  def up
    create_table :searches do |t|
      t.string :location
      t.decimal :min_price
      t.decimal :max_price
      t.decimal :min_area
      t.decimal :max_area

      t.timestamps
    end
  end
  def down
    drop_table :searches
  end
end
