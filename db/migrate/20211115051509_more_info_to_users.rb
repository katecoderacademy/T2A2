class MoreInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :phone_number, :string, null: false, default: ""
    add_column :users, :address_id, :string
    add_column :users, :user_id, :string
    add_index :users, :user_id
    add_column :users, :instructor, :boolean
    add_column :users, :admin, :boolean
  end
end
