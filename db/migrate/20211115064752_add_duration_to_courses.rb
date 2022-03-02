class AddDurationToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :duration, :time
  end
end
