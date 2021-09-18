class CreatePortfolioItems < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolio_items do |t|
      t.attachment :image
      t.timestamps
    end
  end
end
