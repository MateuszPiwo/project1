class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.integer :cup, default: 42
      t.string :flower, null: false, limit: 20
      t.datetime :date
      t.timestamps
    end
  end
end