require 'rails_helper'

RSpec.describe "search index page" do
  it "can search the image database based on title" do 
    target_image = create(:image, title: "BlackPink")
    decoy_image = create(:image, title: "PinkBlack")
    visit root_path

    fill_in 'query', with: 'BlackPink'
    click_on("Search")

    expect(current_path).to eq(search_index_path)
    expect(page).to have_content(target_image.title)
    expect(page).to have_content(target_image.owner)
    expect(page).to have_content(target_image.text)
    expect(page).to have_content(target_image.description)
    expect(page).to have_content(target_image.characteristic)

    expect(page).to_not have_content(decoy_image.title)
  end

  it "can search image database regardless of case sensitivity" do 
    target_image = create(:image, title: "blackpink")
    decoy_image = create(:image, title: "PinkBlack")
    visit root_path

    fill_in 'query', with: 'BlackPink'
    click_on("Search")
    
    expect(current_path).to eq(search_index_path)
    expect(page).to have_content(target_image.title)
    expect(page).to have_content(target_image.owner)
    expect(page).to have_content(target_image.text)
    expect(page).to have_content(target_image.description)
    expect(page).to have_content(target_image.characteristic)

    expect(page).to_not have_content(decoy_image.title)
  end
  
  it "edge case testing for title queries" do 
    target_image = create(:image, title: "bl@ckpink")
    visit root_path

    fill_in 'query', with: 'BlackPink'
    click_on("Search")
    
    expect(current_path).to eq(search_index_path)
    expect(page).to_not have_content(target_image.title)
  end

  it "edge case testing for title queries" do 
    target_image = create(:image, title: "bl@ckpink")
    visit root_path

    fill_in 'query', with: 'Pink'
    click_on("Search")
    
    expect(current_path).to eq(search_index_path)
    expect(page).to have_content(target_image.title)
  end

  it "can search the image database based on owner" do
    owner_image = create(:image, owner: "BlackPink")
    decoy_image = create(:image)
    visit root_path

    fill_in 'query', with: 'BlackPink'
    click_on("Search")

    expect(current_path).to eq(search_index_path)
    expect(page).to have_content(owner_image.title)
    expect(page).to have_content(owner_image.owner)
    expect(page).to have_content(owner_image.text)
    expect(page).to have_content(owner_image.description)
    expect(page).to have_content(owner_image.characteristic)
  end 

  it "can search the image database based on description" do 
    title_image = create(:image, title: "BlackPink")
    description_image = create(:image, description: "blackpink")
    decoy_image = create(:image)
    visit root_path

    fill_in 'query', with: 'BlackPink'
    click_on("Search")

    expect(current_path).to eq(search_index_path)
    expect(page).to have_content(title_image.title)
    expect(page).to have_content(title_image.owner)
    expect(page).to have_content(title_image.text)
    expect(page).to have_content(title_image.description)
    expect(page).to have_content(title_image.characteristic)

    expect(page).to have_content(description_image.title)
    expect(page).to have_content(description_image.owner)
    expect(page).to have_content(description_image.text)
    expect(page).to have_content(description_image.description)
    expect(page).to have_content(description_image.characteristic)

    expect(page).to_not have_content(decoy_image.title)
  end
end