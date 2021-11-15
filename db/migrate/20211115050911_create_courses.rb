class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :fee
      t.datetime :time
      t.boolean :online
      t.string :instructor_name
      t.decimal :practice_management
      t.decimal :substantive_law
      t.decimal :ethics
      t.decimal :professional_skills
      t.string :course_category

      t.timestamps
    end
  end
end
