class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.references :shift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
