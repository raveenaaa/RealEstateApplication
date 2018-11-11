class AddHouseToInquiries < ActiveRecord::Migration[5.1]
  def change
    add_reference :inquiries, :house, foreign_key: true
  end
end
