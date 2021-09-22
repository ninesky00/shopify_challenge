require 'rails_helper'

RSpec.describe "image index page" do
  it "displays all images' attributes" do 
    image_list = create_list(:image, 10)
    visit images_path

    image_list.each do |image|
      expect(page).to have_content(image.title)
      expect(page).to have_content(image.owner)
      expect(page).to have_content(image.description)
    end
  end
end