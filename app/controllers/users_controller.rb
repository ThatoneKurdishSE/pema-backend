#requiring the csv gem to access CSV features and manipulate data
require 'csv'
# require 'rspec/autorun'

class UsersController < ApplicationController
    #Creating a user with auth
    def create
        @user = User.create!(
            username: params[:username],
            password: params[:password],
            email: params[:email],
            name: params[:name],
        )
        render json: { user: @user }, status: :created
    end

    #Create method test
    # describe create do
    #     it "creates new user" do
    #         expect(User.create).to eq(@user)
    #     end
    # end


        def parse_csv
        # method that parses comma separated values into digestable data.
        csv_string = params[:csv].read
        # taking the params of csv and using .read puts data into strings in a row fashion
        @users = CSV.parse(csv_string, headers: true).map do |row|
        # using the row param data to create a new user instance
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