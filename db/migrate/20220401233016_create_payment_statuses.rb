class CreatePaymentStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_statuses do |t|
      t.references :payment_mode, null: false, foreign_key: true
      t.string :payment_detail
      t.float :amount
      t.string :uuid
      t.bigint :title_id, foreign_key: true

      t.timestamps
    end
  end
end
