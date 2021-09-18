class Image < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_one_attached :image

  attr_accessor :color_count

  has_many :portfolio_colors, dependent: :destroy
  has_many :colors, through: :portfolio_colors

  after_save :extract_colors

  
  class << self
    def search_characteristics(query)
      columns = %w{title owner description text}
      where(columns.map {|c| "#{c} like :query"}.join(' OR '),
      query: "%#{query}%")
      # where('title like ?', "%#{query}%")
    end
  end

  private

  def image_on_disk
    ActiveStorage::Blob.service.send(:path_for, self.image.blob.key)
  end

  def extract_colors
    binding.pry
    image = Camalian::load(image_on_disk)
    colors = image.prominent_colors(self.color_count.to_i).sort_similar_colors
    colors.each do |color|
      unless c = Color.where(r: color.r, g: color.g, b: color.b).first
        c = Color.create(r: color.r, g: color.g, b: color.b, h: color.h, s: color.s, l: color.l)
      end
      self.colors << c
    end
  end
end


# characteristics = title, owner, description
# text = tags
# image search?