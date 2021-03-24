class UsersController < ApplicationController

    def create
        @user = User.create(
            username: params[:username],
            password: params[:password],
            email: params[:email],
            name: params[:name],
        )
        render json: { user: @user }, status: :created
    end
end
