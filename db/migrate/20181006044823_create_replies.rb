class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :message
      t.references :realtor
      t.references :inquiry
      t.timestamps
    end
  end
end
