class AddKeysToEnrollments < ActiveRecord::Migration[6.1]
  def change
    add_reference :enrollments, :courses,  foreign_key: true
    add_reference :enrollments, :users, foreign_key: true
  end
end
