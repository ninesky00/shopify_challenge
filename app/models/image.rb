class Image < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  class << self
    def search(query)
      where('title like ?', "%#{query}%")
    end
  end
end
