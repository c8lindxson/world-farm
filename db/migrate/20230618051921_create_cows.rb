class CreateCows < ActiveRecord::Migration[7.0]
  def change
    create_table :cows do |t|
      t.references :farm, null: false, foreign_key: true
      t.string :gender
      t.integer :milk, default: 0
      t.integer :energy, default: 0

      t.timestamps
    end
  end
end
