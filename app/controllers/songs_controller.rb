class SongsController < ApplicationController
  def index
    @songs = Song.all
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
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      @errors = @song.errors.full_messages
      render :edit
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to songs_path
  end

  private
    def song_params
      params.require(:song).permit(:title)
    end
end
