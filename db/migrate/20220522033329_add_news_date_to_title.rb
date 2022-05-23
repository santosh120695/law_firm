class AddNewsDateToTitle < ActiveRecord::Migration[7.0]
  def change
    add_column :titles, :news_date, :date
  end
end
