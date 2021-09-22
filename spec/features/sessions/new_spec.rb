require 'rails_helper'
require 'pry'
RSpec.describe 'new user session' do
  it 'allows user to login' do
    visit login_path

    user = User.create(username: 'test5', email: 'test5@gmail.com', password: 'test5test5')

    fill_in 'email', with: 'test5@gmail.com'
    fill_in 'password', with: 'test5test5'
    click_button 'Login'
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You are logged in!')
  end

  it 'will redirect the user if user is already logged in' do
    user = User.create(username: 'test5', email: 'test5@gmail.com', password: 'test5test5')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.authenticate(user.password)

    visit login_path
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You are already logged in!')
  end

  it 'user is logged out if click_on logout' do
    visit login_path

    user = User.create(username: 'test5', email: 'test5@gmail.com', password: 'test5test5')

    fill_in 'email', with: 'test5@gmail.com'
    fill_in 'password', with: 'test5test5'
    click_button 'Login'
    expect(page).to have_link('Log Out')
    click_link 'Log Out'
    expect(page).to have_content('You are logged out')
  end

  it 'will kick back if incorrect login' do
    user = User.create(username: 'test5', email: 'test5@gmail.com', password: 'test5test5')
    visit login_path

    fill_in 'email', with: 'test4@gmail.com'
    fill_in 'password', with: 'test4test4'
    click_button 'Login'
    expect(page).to have_content('Invalid login email, or password')
  end
end
