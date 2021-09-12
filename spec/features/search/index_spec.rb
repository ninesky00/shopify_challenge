require 'rails_helper'
require 'pry'

RSpec.describe "search index page" do
  it "can search the iamge database for images based on title" do 
    target = create(:image, title: "BlackPink")
    decoy = create(:image, title: "PinkBlack")
    visit root_path

    fill_in 'query', with: 'BlackPink'
    click_on("Search")
    
    expect(current_path).to eq(search_index_path)
    expect(page).to have_content(target.title)
    expect(page).to have_content(target.owner)
    expect(page).to have_content(target.text)
    expect(page).to have_content(target.description)
    expect(page).to have_content(target.characteristic)

    expect(page).to_not have_content(decoy.title)
    expect(page).to_not have_content(decoy.owner)
    expect(page).to_not have_content(decoy.text)
    expect(page).to_not have_content(decoy.description)
    expect(page).to_not have_content(decoy.characteristic)
  end

  it "can search image database regardless of case sensitivity" do 
    target = create(:image, title: "blackpink")
    decoy = create(:image, title: "PinkBlack")
    visit root_path

    fill_in 'query', with: 'BlackPink'
    click_on("Search")
    
    expect(current_path).to eq(search_index_path)
    expect(page).to have_content(target.title)
    expect(page).to have_content(target.owner)
    expect(page).to have_content(target.text)
    expect(page).to have_content(target.description)
    expect(page).to have_content(target.characteristic)

    expect(page).to_not have_content(decoy.title)
    expect(page).to_not have_content(decoy.owner)
    expect(page).to_not have_content(decoy.text)
    expect(page).to_not have_content(decoy.description)
    expect(page).to_not have_content(decoy.characteristic)
  end
end