class CreatePasswordsReset < ActiveRecord::Migration[6.0]
  def change
    create_table :password_resets do |t|
      t.string :token
      t.datetime :token_created_at
      t.integer :user_id

      t.timestamps
    end
  end
end
