class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name
      t.float :rera_carpet_area
      t.float :exclusive_area
      t.float :open_terrace
      t.float :total_area
      t.float :undivided_share_of_land
      t.string :jantri
      t.float :jantri_amount
      t.references :tower, null: false, foreign_key: true
      t.references :floor, null: false, foreign_key: true
      t.bigint :project_id
      t.string :uuid

      t.timestamps
    end
  end
end
