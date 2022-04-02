class CreateTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :titles do |t|
      t.references :client, null: false, foreign_key: true
      t.string :block_no
      t.string :pincode
      t.string :village
      t.string :taluka
      t.string :description
      t.bigint :status_id
      t.string :uuid

      t.timestamps
    end
  end
end
