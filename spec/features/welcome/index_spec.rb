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
end