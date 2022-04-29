class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.string :name
      t.references :tower, null: false, foreign_key: true
      t.string :uuid

      t.timestamps
    end
  end
end
