class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :address
      t.integer :size
      t.integer :year
      t.integer :revenue
      t.text :synopsis

      t.timestamps
    end
  end
end
