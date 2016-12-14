class ArtistsController < ApplicationController
  before_action :artist_finder, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to @artist
    else
      @errors = @artist.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      @errors = @artist.errors.full_messages
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private 
    def artist_finder
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :image_path)
    end
end