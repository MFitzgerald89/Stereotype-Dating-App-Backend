class AddColumnMatchedUserIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :matched_user_id, :integer
  end
end
