require 'rails_helper'

RSpec.feature "User sees all artists" do
  scenario "they see the page for all artists" do
    artist_name1       = "Bob Marley"
    artist_image_path1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: artist_name1, image_path: artist_image_path1)

    visit artists_path
    
    expect(page).to have_content artist_name1
  end
end