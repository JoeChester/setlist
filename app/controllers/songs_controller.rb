class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.where(:user => current_user).order(artist: :asc)
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    respond_to do |format|
      if @song.user != current_user
        format.html { redirect_to songs_url, notice: 'You can not show songs of other users.' }
        format.json { head :no_content }
      else
        format.html
        format.json { render json: @song }
      end
    end
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    @song.user = current_user
    @song.rating = 0
    @song.number_of_practices = 0
    @song.last_practiced = DateTime.now

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #GET /songs/random
  #GET /songs/random.json
  def random
    @song = Song.where(:user => current_user).sample
    respond_to do |format|
      format.html
      format.json { render json: @song }
    end
  end

  #GET /song/1/practice
  #GET /song/1/practice.json
  def practice
    set_song()
    respond_to do |format|
      if @song.user != current_user
        format.html { redirect_to songs_url, notice: 'You can not show songs of other users.' }
        format.json { head :no_content }
      else
        @song.last_practiced = DateTime.now
        @song.number_of_practices += 1
        @song.save
        format.html
        format.json { render json: @song }
      end
    end
  end

  #GET /song/1/upvote
  #GET /song/1/upvote.json
  def upvote
    set_song()
    respond_to do |format|
      if @song.user != current_user
        format.html { redirect_to songs_url, notice: 'You can not show songs of other users.' }
        format.json { head :no_content }
      else
        @song.rating += 1
        @song.save
        format.html
        format.json { render json: @song }
      end
    end
  end

  #GET /song/1/downvote
  #GET /song/1/downvote.json
  def downvote
    set_song()
    respond_to do |format|
      if @song.user != current_user
        format.html { redirect_to songs_url, notice: 'You can not show songs of other users.' }
        format.json { head :no_content }
      else
        if @song.rating > 0
          @song.rating -= 1
          @song.save
        end
        format.html
        format.json { render json: @song }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :artist, :rating, :last_practiced, :number_of_practices, :comment)
    end
end
