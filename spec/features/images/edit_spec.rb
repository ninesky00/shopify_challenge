require 'rails_helper'

RSpec.describe 'image edit' do
  it 'allows user to login' do
    visit login_path

    user = User.create(username: 'test5', email: 'test5@gmail.com', password: 'test5test5')

    fill_in 'email', with: 'test5@gmail.com'
    fill_in 'password', with: 'test5test5'
    click_button 'Login'
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You are logged in!')
  end