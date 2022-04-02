class CreatePaymentModes < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_modes do |t|
      t.string :name
      t.string :uuid
      t.boolean :active

      t.timestamps
    end
  end
end
