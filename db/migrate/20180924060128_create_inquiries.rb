class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.string :subject
      t.text :message
      t.references :house_hunter
      t.timestamps
    end
  end
end
