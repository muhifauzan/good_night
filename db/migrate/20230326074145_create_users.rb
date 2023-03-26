class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :users, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
