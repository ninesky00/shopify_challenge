require 'rails_helper'

RSpec.describe "new user" do
  it "allows user to register" do 
    visit registration_path

    user_username = 'test5'
    user_email = 'test5@gmail.com'
    user_password = 'test5test5'
    within('#registration_form') do
      fill_in 'user[username]', with: user_username
      fill_in 'user[email]', with: user_email
      fill_in 'user[password]', with: user_password
      fill_in 'user[password_confirmation]', with: user_password
      click_button 'Register'
    end
    user = User.find_by(email: user_email)
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You signed up successfully')
  end

  it "won't allow user creation if password doesn't match" do
    visit registration_path
    user_username = 'test5'
    user_email = 'test5@gmail.com'
    user_password = 'test5test5'
    within('#registration_form') do
      fill_in 'user[username]', with: user_username
      fill_in 'user[email]', with: user_email
      fill_in 'user[password]', with: user_password
      fill_in 'user[password_confirmation]', with: 'test4test4'
      click_button 'Register'
    end
    expect(current_path).to eq(registration_path)
    expect(page).to have_content('Passwords do not match')
  end

  it 'downcases email address before saving to database' do
    visit registration_path
    user_username = 'test5'
    user_email = 'TEST5@gmail.com'
    user_password = 'test5test5'

    within('#registration_form') do
      fill_in 'user[username]', with: user_username
      fill_in 'user[email]', with: user_email
      fill_in 'user[password]', with: user_password
      fill_in 'user[password_confirmation]', with: user_password
      click_button 'Register'
    end
    user = User.find_by(email: 'test5@gmail.com')
    expect(user.email).to eq(user_email.downcase)
  end

  it 'displays error message for missing information for a new user' do
    visit registration_path

    user_email = 'test5@gmail.com'

    within('#registration_form') do
      fill_in 'user[email]', with: user_email
      click_button 'Register'
    end
    expect(page).to have_content("Password can't be blank")
  end

  it 'does not allow user to register without email' do 
    visit registration_path

    within('#registration_form') do
      fill_in 'user[password]', with: 'test5@gmail.com'
      fill_in 'user[password_confirmation]', with: 'test5@gmail.com'
      click_button 'Register'
    end
    expect(page).to have_content("Email can't be blank")
  end
end