class AddColumnUserId < ActiveRecord::Migration[7.0]
  def change
    add_column :genres, :user_id, :integer
  end
end
