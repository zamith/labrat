class CreateTubes < ActiveRecord::Migration
  def change
    create_table :tubes do |t|
      t.integer :row, null: false, default: 0
      t.integer :column, null: false, default: 0
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
    add_index :tubes, [:row, :column], unique: true
  end
end
