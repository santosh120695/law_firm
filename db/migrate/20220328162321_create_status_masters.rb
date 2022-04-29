class CreateStatusMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :status_masters do |t|
      t.string :name
      t.string :color
      t.boolean :active, default: true
      t.string :uuid
      t.string :status_type
      t.boolean :initial, default: false
      

      t.timestamps
    end
  end
end
