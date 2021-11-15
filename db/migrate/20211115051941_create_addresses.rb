class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_line_1, null: false
      t.string :address_line_2
      t.string :suburb, null: false
      t.string :state, null: false
      t.integer :postcode, null: false
      t.string :address_id 

      t.timestamps
    end
  end
end
