class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.string :name
      t.string :uuid
      t.string :detail_type

      t.timestamps
    end
  end
end
