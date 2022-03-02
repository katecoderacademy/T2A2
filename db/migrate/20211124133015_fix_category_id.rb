class FixCategoryId < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :categories_id, :category_id
  end
end
