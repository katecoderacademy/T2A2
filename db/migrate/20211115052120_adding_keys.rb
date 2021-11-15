class AddingKeys < ActiveRecord::Migration[6.1]
  def change
    add_index :courses, :courses_id    
    add_index :addresses, :address_id
    add_index :users, :user_id
    add_reference :users, :courses, foreign_key: true
    add_reference :addresses, :users, foreign_key: true
  end
end
