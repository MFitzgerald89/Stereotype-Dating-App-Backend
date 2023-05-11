class RemoveForeignKeyFromPhotos < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :photos, :users

  end
end
