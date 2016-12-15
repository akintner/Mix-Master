require 'rails_helper'

RSpec.feature "User sees all songs" do
  scenario "they see the page for all songs" do
    song_one, song_two, song_three = create_list(:song, 3)

    visit songs_path
    
    expect(page).to have_content "All Songs"
    expect(page).to have_content song_one.title
  end
end