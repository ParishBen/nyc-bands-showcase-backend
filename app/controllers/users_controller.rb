class UsersController < ApplicationController
    
    def create    # Acting like a find_or_create_by method ==> will find the user to start the session or create the new user & start session
        @foundUser = User.find_by(email: params[:email])
          if @foundUser && @foundUser.authenticate(params[:password])
            session[:user_id] = @foundUser.id
            render json: @foundUser, serializer: UserSerializer
        
          elsif @user = User.new(user_params)
            @user.password = params[:password]
          if @user.save
             session[:user_id] = @user.id
             render json: @user, serializer: UserSerializer
          else
            resp = {
                error: "Invalid User Credentials",
                details: @user.errors.full_messages || @foundUser.errors.full_messages
                }
            render json: resp, status: :unauthorized
         end
     end
 end
 
     private
    
    def user_params
        params.require(:user).permit(:name, :email)
    end
    
end
