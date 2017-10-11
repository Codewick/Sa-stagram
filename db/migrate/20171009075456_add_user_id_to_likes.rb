class AddUserIdToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :photo_id, :integer
  end
end
