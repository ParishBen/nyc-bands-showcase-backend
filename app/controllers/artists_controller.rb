class ArtistsController < ApplicationController
 
    def create             #Taking in Artist params & saving if Artist not in DB.                          
        @artist = Artist.new(artist_params)
        @user = User.find_by(name: params[:username])
        @artist.user_id = @user.id                                                             
        
         if !@user.artists.all.find_by(artist_id: params[:id])
            @artist.save                                                           
            render json: @artist.to_json  
        else
            resp = {
            error: "#{@artist.name} is Already a Fave!",
            details: @artist.errors.full_messages
            }
          render json: resp, status: :unauthorized
        end      
      end
    
    def index
        user = User.find_by(name: params[:name])
        render json: user.artists.all.to_json        
    end
    
    def new
        @artist = Artist.new        
    end

    def destroy
        @user = User.find_by(name: params[:name]) 
        @artist = @user.artists.find_by(artist_id: params[:id])
               
        if @artist
            @artist.destroy
        end
    end

        private
        def artist_params
            params.require(:artist).permit(:name, :artist_id, :user_id, :username)
        end
end
