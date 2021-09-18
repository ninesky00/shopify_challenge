require 'rails_helper'
require 'pry'

RSpec.describe "image show page" do
  it "displays the image attributes" do 
    target_image = create(:image)
    visit image_path(target_image)
    binding.pry

    expect(page).to have_content(target_image.title)
    expect(page).to have_content(target_image.owner)
    expect(page).to have_content(target_image.description)
    expect(page).to have_css("img")
  end

  it "shows the image's attached image" do 
  end
end