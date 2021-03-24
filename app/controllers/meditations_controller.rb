class MeditationsController < ApplicationController
    def index
        authrization_header = request.headers["authorization"]
        token = authrization_header.split(" ")[1]
        if !token
            render json: { error: "Not authorized!" }, status: :unauthorized
        else
            secret = "TOP SECRET"
            begin 
            payload = JWT.decode(token, secret).first
                @user = User.find(payload["user_id"])
            @meditations = Meditation.all

            render json: { meditations: @meditations }
            rescue
                render json: { error: "Not authorized!" }, status: :unauthorized
            end
        end
    end
end
