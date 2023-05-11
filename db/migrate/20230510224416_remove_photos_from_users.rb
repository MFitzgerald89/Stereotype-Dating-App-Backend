class RemovePhotosFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :photos, :string
  end
end
