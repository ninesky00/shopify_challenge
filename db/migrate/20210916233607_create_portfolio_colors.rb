class CreatePortfolioColors < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolio_colors do |t|
      t.references :image, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
    end
  end
end
