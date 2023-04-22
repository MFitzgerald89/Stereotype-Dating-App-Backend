class RemoveUserIdFromGenres < ActiveRecord::Migration[7.0]
  def change
    remove_column :genres, :user_id
  end
end
