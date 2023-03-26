class CreateUsersFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :users_follows, id: :uuid do |t|
      t.references :followee, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :follower, null: false, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end

    add_index :users_follows, [:follower_id, :followee_id], unique: true
  end
end
