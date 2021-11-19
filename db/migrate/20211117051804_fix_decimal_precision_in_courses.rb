class FixDecimalPrecisionInCourses < ActiveRecord::Migration[6.1]
  def change
    # change_column :courses, :practice_management, precision: 1, scale: 20
    # change_column :courses, :substantive_law, precision: 1, scale: 20
    # change_column :courses, :ethics, precision: 1, scale: 20
    # change_column :courses, :professional_skills, precision: 1, scale: 20
    change_column :courses, :fee, :decimal, precision: 2
    add_column :courses, :url, :text
    rename_column :courses, :time, :start_time
    #add_column :courses, :end_time, :time
    add_column :courses, :end_time, :time
    add_column :courses, :instructor_role, :string
  end
end
