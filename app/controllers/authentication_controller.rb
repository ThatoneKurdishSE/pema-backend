class AuthenticationController < ApplicationController
    def login
        @user = User.find_by username: params[:username]

        if !@user
            render json: {message: "Oh no, bad username!"}, status: :unauthorized
        else
            if !@user.authenticate params[:password]
                render json: {message: "Oh no, bad password!"}, status: :unauthorized
        else
            if !@user.authenticate params[:email]
                render json: {message: "Oh no, bad email address!"}, status: :unauthorized
        else
            payload = {
                user_id: @user.id
            }
            secret = "TOP SECRET"
            #ENV['SECRET_KEY_BASE']
            token = JWT.encode(payload, secret)
                
            render json: { token: token }, status: :created
                end
            end
        end
    end
end
