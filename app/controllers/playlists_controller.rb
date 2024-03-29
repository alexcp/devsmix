class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:edit, :update, :destroy]
  before_action :ensure_user_is_logged_in, except: :show

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    begin
      @playlist = Playlist.includes(:songs).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  # GET /playlists/new
  def new
    @playlist = current_user.playlists.new
    @playlist.songs.build
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = current_user.playlists.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = current_user.playlists.find(params[:id])
  end

  def ensure_user_is_logged_in
    unless current_user
      redirect_to root_path, notice: "Please login with your github account"
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def playlist_params
    params.require(:playlist).permit(:name, :cover, :author, songs_attributes: [:id, :title, :url, :_destroy])
  end
end
