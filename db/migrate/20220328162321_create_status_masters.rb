class CreateStatusMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :status_masters do |t|
      t.string :name
      t.string :color
      t.string :active
      t.string :uuid

      t.timestamps
    end
  end
end
