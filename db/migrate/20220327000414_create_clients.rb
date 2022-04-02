class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :uuid
      t.boolean :active
      t.string :location
      t.string :contact_no

      t.timestamps
    end
  end
end
