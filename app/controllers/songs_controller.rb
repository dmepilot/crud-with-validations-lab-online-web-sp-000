class SongsController < ApplicationController
    def index
        @songs= Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if @song.save
        redirect_to song_path(@song)
        else
          render :new
        end
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
          render :edit
        end
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_url
      end
    
      private
    
      def song_params
        # params.permit(:title, :released, :release_year, :artist_name, :genre)
        params.require(:song).permit(
            :title, :release_year, :released, :genre, :artist_name
          )
      end

end