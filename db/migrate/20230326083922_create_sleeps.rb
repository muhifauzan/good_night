class CreateSleeps < ActiveRecord::Migration[7.0]
  def change
    create_table :sleeps, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
