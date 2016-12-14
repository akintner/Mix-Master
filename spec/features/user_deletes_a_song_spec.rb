require 'rails_helper'

RSpec.feature "User deletes a song" do
  scenario "they can delete an individual song" do
     artist = create(:artist)

    song_title = "Who's Going To Ride Your Wild Horses?'"

    visit artist_path(artist)
    click_on "New song"
    fill_in "song[title]", with: song_title
    click_on "Create Song"
    song = artist.songs.ids
    
    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)

    visit song_path(song)
    click_on "Delete song"

    expect(page).to have_content("All Songs")
  end
end