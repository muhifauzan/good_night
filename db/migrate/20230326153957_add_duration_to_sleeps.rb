class AddDurationToSleeps < ActiveRecord::Migration[7.0]
  def change
    add_column :sleeps, :duration, :time
  end
end
