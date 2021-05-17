require 'csv'

class UsersController < ApplicationController

    def create
        @user = User.create!(
            username: params[:username],
            password: params[:password],
            email: params[:email],
            name: params[:name],
        )
        render json: { user: @user }, status: :created
    end

    def parse_csv
        csv_string = params[:csv].read
        @users = CSV.parse(csv_string, headers: true).map do |row|
            User.create!(
                username: row["username"],
                name: row["name"],
                password: row["password"],
                email: row["email"]
            )
        end
        render json: { users: @users }, status: :created
    end
end
