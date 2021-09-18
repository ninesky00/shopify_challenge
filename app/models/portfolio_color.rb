class PortfolioColor < ApplicationRecord
  belongs_to :portfolio_item
  belongs_to :color
end
