class UsersController < ApplicationController

    def log_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {username: user.username, token: issue_token({id: user.id})}
        else
            render json: {error: 'Invalid username/password combination.'}, status: 400
        end
    end

    def validate
    user = get_current_user
    if user
        render json: {username: user.username, token: issue_token({id: user.id})}
    else
        render json: {error: "User not found"}, status: 400
        end
    end

    def get_booklets
        user = get_current_user
        if user 
            render json: user.booklets, serializer: BookletsSerializer
        else
            render json: {error: "you are not signed in."}
        end
    end

    def create
        puts params["password"]
        user = User.create(username: params[:username], password: params[:password])
       
        if user
            render json: {username: user.username, token: issue_token({id: user.id})}
        else
            render json: {error: "User not found"}
        end

    end


end


