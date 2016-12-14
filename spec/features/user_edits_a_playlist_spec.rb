require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they can edit an individual playlist" do
    artist = create(:artist)
    playlist = create(:playlist)
    song1 = create(:song)
    song2 = create(:song)
    song3 = create(:song)

    playlist.songs << song1
    playlist.songs << song2    
    playlist.songs << song3

    

    visit playlist_path(playlist)
    click_on "Edit Playlist"
    check("song-#{song3.id}")
    uncheck("song-#{song1.id}")
    click_on "Update Playlist"

    expect(page).to have_content song3.title
    expect(page).not_to have_content song1
  end
end