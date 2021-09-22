class Image < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_one_attached :image
  validates :image, attached: true, content_type: %w(image/png image/jpg image/jpeg)

  class << self
    def search_characteristics(query)
      columns = %w{title owner description text}
      where(columns.map {|c| "#{c} like :query"}.join(' OR '),
      query: "%#{query}%")
      # where('title like ?', "%#{query}%")
    end
  end
end


# characteristics = title, owner, description
# text = tags
# image search?