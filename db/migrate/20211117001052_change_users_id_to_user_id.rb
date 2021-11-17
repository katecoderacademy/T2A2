class ChangeUsersIdToUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :users_id, :user_id
  end
end
