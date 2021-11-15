class AddingKeys < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :course_id, :string
    add_index :courses, :course_id, unique:true    
    add_index :addresses, :address_id
    add_reference :users, :courses, foreign_key: true
    add_reference :addresses, :users, foreign_key: true
  end
end
