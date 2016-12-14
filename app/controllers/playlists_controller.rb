class PlaylistsController < ApplicationController
  before_action :playlist_finder, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    @songs = Song.all
    @playlist = Playlist.create(playlist_params)
    if @playlist.save
      redirect_to playlists_path
    else
      @errors = @playlist.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
    @songs = Song.all
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to playlist_path(@playlist)
    else
      @errors = @playlist.errors.full_messages
      render :edit
    end
  end

  def destroy 
    @playlist.destroy
    redirect_to playlists_path
  end

  private
    def playlist_finder
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:name, song_ids: [])
    end
end
