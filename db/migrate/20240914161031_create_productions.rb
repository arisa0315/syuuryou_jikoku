class CreateProductions < ActiveRecord::Migration[6.1]
  def change
    create_table :productions do |t|
      t.references :shift, null: false, foreign_key: true
      t.integer :production_quantity, null: false
      t.datetime :end_time
      
      t.timestamps
    end
  end
end
