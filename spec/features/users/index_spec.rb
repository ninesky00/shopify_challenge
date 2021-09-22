require 'rails_helper'

RSpec.describe "user index page" do
  it "displays images uploaded by the user" do 
    user = create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.authenticate(user.password)
    images = create_list(:image, 5, owner: user.username)

    visit images_user_path(user)

    images.each do |image|
      expect(page).to have_content(image.title)
      expect(page).to have_content(image.owner)
      expect(page).to have_content(image.description)
    end
  end
end