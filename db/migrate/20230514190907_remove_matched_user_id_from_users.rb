class RemoveMatchedUserIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :matched_user_id, :integer
  end
end
