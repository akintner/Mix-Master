require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario "they can edit an individual song" do
    artist = create(:artist)
    song_title = "Big Yellow Taxi"

    visit artist_path(artist)
    click_on "New song"
    fill_in "song[title]", with: song_title
    click_on "Create Song"
    song = artist.songs.ids


    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)

    visit song_path(song)
    click_on "Edit song"
    fill_in "song[title]", with: "Big Yellow Taxi (live)"
    click_on "Update Song"

    expect(page).to have_content "Big Yellow Taxi (live)"
  end
end