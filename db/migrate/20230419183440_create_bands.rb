class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.text :notes
      t.integer :genre_id
      t.integer :user_id

      t.timestamps
    end
  end
end
