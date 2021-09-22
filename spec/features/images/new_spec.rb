require 'rails_helper'
require 'pry'
RSpec.describe 'new image' do
  it 'allows user to upload and create an image' do
    user = create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.authenticate(user.password)

    image_count = Image.all.count

    visit new_image_path
    attach_file 'image[image]', 'spec/fixtures/files/sample.png'
    fill_in 'image[title]', with: 'blackpink'
    fill_in 'image[description]', with: 'wow'
    click_button 'Create Image'

    expect(Image.all.count).to eq(image_count + 1)
  end

  it 'does not allow user to upload if not logged in' do 
    visit new_image_path
    expect(page).to_not have_button('Create Image')
  end

  it 'should not post if fields are blank' do 
    user = create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.authenticate(user.password)

    image_count = Image.all.count

    visit new_image_path
    attach_file 'image[image]', 'spec/fixtures/files/sample.png'
    fill_in 'image[description]', with: 'wow'
    click_button 'Create Image'

    expect(Image.all.count).to eq(image_count)
  end
end