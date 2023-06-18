class CreateChickens < ActiveRecord::Migration[7.0]
  def change
    create_table :chickens do |t|
      t.references :farm, null: false, foreign_key: true
      t.string :gender
      t.integer :egg, default: 0
      t.integer :energy, default: 0

      t.timestamps
    end
  end
end
