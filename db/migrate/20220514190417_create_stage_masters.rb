class CreateStageMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :stage_masters do |t|
      t.string :name
      t.string :uuid

      t.timestamps
    end
  end
end
