class SongsController < ApplicationController
  before_action :song_finder, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
    # @artist = Artist.find(params[:artist_id])
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)

    redirect_to song_path(@song)
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      @errors = @song.errors.full_messages
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private
    def song_finder
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title)
    end
end
