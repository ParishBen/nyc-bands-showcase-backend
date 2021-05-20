class SessionsController < ApplicationController

  def get_current_user          #if session present? Will return the Current_user serialized data
    if logged_in?
        render json: current_user, serializer: UserSerializer   
    else
        render json: {error: "Please sign in below."}
    end
end

def set_token          # Taking request from frontend & posting session[:token] => returning that value
    @token = params[:token]
      if @token
        session[:token] = @token
        json_token= {token: @token}
        render json: json_token
      else
        resp = {
            error: "Invalid User Credentials",
            details: @token.errors.full_messages
            }
        render json: resp, status: :unauthorized
    end
end

def get_token                   #request for the session[:token] information if present.
    @token = session[:token]
        if @token
            json_token= {token: @token}
            render json: json_token   
        else
            resp = {
            error: "Invalid User Credentials",
            details: @user.errors.full_messages
            }
        render json: resp, status: :unauthorized
    end
end

def destroy        # logout process clear all session data.
    session.clear
    render json: {
        message: "You have logged out."
    }
end

private

    def user_params
        params.require(:user).permit(:email, :name, :password, :token)
    end
end

