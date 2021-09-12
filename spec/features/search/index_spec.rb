require 'rails_helper'
require 'pry'

RSpec.describe "search index page" do
  it "can search the iamge database for images based on title" do 
    target = Image.create!(title: "BlackPink", description: "black")
    decoy = Image.create!(title: "PinkBlack", description: "pink")
    visit root_path

    fill_in 'query', with: 'BlackPink'
    click_on("Search")
    
    expect(current_path).to eq(search_index_path)
    binding.pry
  end
end