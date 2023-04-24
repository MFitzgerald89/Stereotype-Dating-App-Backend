class AddColumnMatchedUserIdToMatch < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :matched_user_id, :integer
  end
end
