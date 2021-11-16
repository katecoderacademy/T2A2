class AddingKeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :courses, foreign_key: true
    add_reference :addresses, :users, foreign_key: true
  end
end
