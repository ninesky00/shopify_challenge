class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :title
      t.string :artist
      t.string :text
      t.string :description
      t.string :characteristic
      
      t.timestamps
    end
  end
end
