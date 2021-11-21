class CreateEnrollmentId < ActiveRecord::Migration[6.1]
  def change
      # add_column :enrollments, :enrollment_id, :integer
      # rename_column :enrollments, :users_id, :user_id
      # rename_column :enrollments, :courses_id, :course_id
      t.timestamps
    
  end
end
