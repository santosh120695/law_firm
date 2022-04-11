class CreateStateTransitions < ActiveRecord::Migration[7.0]
  def change
    create_table :state_transitions do |t|
      t.string :item_type
      t.bigint :item_id
      t.string :comment
      t.string :from 
      t.string :to
      t.string :uuid
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
