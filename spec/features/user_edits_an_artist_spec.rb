require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they can edit an individual artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    sample = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(sample)
    click_on "Edit artist"
    fill_in "artist_name", with: "Bob Marley Jr."
    click_on "Update Artist"

    expect(page).to have_content "Bob Marley Jr."
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end