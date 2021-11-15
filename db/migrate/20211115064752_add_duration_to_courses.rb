class AddDurationToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :course, :duration, :time
  end
end
