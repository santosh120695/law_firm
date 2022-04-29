class CreateDastavejs < ActiveRecord::Migration[7.0]
  def change
    create_table :dastavejs do |t|
      t.references :client, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.string :party_name
      t.string :contact_number
      t.string :uuid
      t.bigint :tower_id
      t.bigint :floor_id
      t.bigint :status_id

      t.timestamps
    end
  end
end
