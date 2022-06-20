class AddNorthToUnit < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :north, :string 
    add_column :units, :south, :string
    add_column :units, :east, :string
    add_column :units, :west, :string
  end
end
