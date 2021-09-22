require 'rails_helper'

RSpec.describe "welcome page" do
  it "has a welcome message" do
    visit root_path

    expect(page).to have_content("Welcome to Shopify Gallery")
  end

  it 'has a link to sign up for new user' do 
    visit root_path

    click_link 'Register'
    expect(current_path).to eq(registration_path)
  end

  it 'has a link to login' do 
    visit root_path

    click_link('Login')
    expect(current_path).to eq(login_path)
  end

  it 'has a search bar link' do 
    visit root_path

    expect(page).to have_field("query")
    expect(page).to have_field("search image")
    
    click_on("Search")
    expect(current_path).to eq(search_index_path)
  end

  it 'once logged as a user, has a my images link' do 
    user = create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.authenticate(user.password)

    visit root_path
    click_link 'My Images'
    expect(current_path).to eq(images_user_path(user.id))
  end
end