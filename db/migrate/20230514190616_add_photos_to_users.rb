class AddPhotosToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :photos, :string
  end
end
