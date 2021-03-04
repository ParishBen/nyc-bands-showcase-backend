class ArtistsController < ApplicationController

    
    def create
        artist = Artist.new(artist_params)
        if !Artist.all.find_by(name: params[:name])
         artist.save
         render json: artist.to_json  
          
      end
    end

    def index
          render json: Artist.all.to_json         
    end
    
    def new
        @artist = Artist.new        
    end

    def destroy
        artist = Artist.find_by(name: params[:id])
        if artist
            artist.destroy
        end
    end

        private
        def artist_params
            params.require(:artist).permit(:name, :id)
        end
end
