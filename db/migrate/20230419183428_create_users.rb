class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :orientation
      t.string :preferred_orientation
      t.string :religion
      t.string :location
      t.string :password_digest

      t.timestamps
    end
  end
end
