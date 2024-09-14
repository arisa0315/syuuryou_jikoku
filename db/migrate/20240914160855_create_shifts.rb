class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.string :shift_name, null: false
      t.float :cycle_time, null: false
      t.float :performance, null: false
      t.datetime :start_time, null: false

      t.timestamps
    end
  end
end
