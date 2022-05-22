class CreateStages < ActiveRecord::Migration[7.0]
  def change
    create_table :stages do |t|
      t.string :item_type
      t.bigint :item_id
      t.references :stage_master, null: false, foreign_key: true
      t.date :stage_date
      t.string :initial_entry
      t.string :final_entry
      t.string :uuid

      t.timestamps
    end
  end
end
