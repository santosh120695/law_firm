class CreateDastavejPricingDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :dastavej_pricing_details do |t|
      t.float :base_price
      t.float :additional_amount
      t.string :tax_class
      t.float :vat_amount
      t.references :dastavej, null: false, foreign_key: true
      t.string :uuid

      t.timestamps
    end
  end
end
