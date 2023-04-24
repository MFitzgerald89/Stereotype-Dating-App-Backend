class CreateUserMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :user_matches do |t|
      t.integer :user_id
      t.integer :matched_user_id
      t.integer :score

      t.timestamps
    end
  end
end
