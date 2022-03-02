class RemoveCourseCategory < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :course_category
    add_reference :courses, :addresses, foreign_key: true
    rename_column :courses, :addresses_id, :address_id
  end
end
