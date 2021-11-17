class AddingKeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :users, foreign_key: true
    add_reference :addresses, :users, foreign_key: true
    remove_column :users, :user_id
  end
end
