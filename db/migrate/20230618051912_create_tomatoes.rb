class CreateTomatoes < ActiveRecord::Migration[7.0]
  def change
    create_table :tomatoes do |t|
      t.references :farm, null: false, foreign_key: true
      t.integer :crop, default: 0
      t.integer :water, default: 0

      t.timestamps
    end
  end
end
