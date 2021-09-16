require 'rails_helper'
require 'pry'

RSpec.describe "search index page" do
  it "can search the image database based on title" do 
    target_image = create(:image, title: "BlackPink")
    decoy_image = create(:image, title: "PinkBlack")
    visit root_path

    fill_in 'query', with: 'BlackPink'
    click_on("Search")
  end
end