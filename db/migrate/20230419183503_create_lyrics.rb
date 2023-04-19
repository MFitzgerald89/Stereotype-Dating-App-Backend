class CreateLyrics < ActiveRecord::Migration[7.0]
  def change
    create_table :lyrics do |t|
      t.text :lyrics
      t.text :notes
      t.integer :song_id
      t.integer :user_id

      t.timestamps
    end
  end
end
