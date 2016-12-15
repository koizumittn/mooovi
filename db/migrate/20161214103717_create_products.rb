class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :title
      t.text    :image_url
      t.string  :director
      t.text    :detail
      t.date    :open_date
      t.string  :open_date_string
      t.timestamps
    end
  end
end
