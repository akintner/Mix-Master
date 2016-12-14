class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  belongs_to :artist
  has_many :playlists, through: :playlist_songs
end
