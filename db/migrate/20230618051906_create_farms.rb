class CreateFarms < ActiveRecord::Migration[7.0]
  def change
    create_table :farms do |t|
      t.string :name, uniqueness: true
      t.integer :age_in_days, default: 1

      t.timestamps
    end
  end
end
