require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they can delete an individual artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    sample = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(sample)
    click_on "Delete artist"

    expect(page).to have_content("All Artists")
  end
end