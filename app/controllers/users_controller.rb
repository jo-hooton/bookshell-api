class UsersController < ApplicationController

    def log_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {username: user.username, token: issue_token({id: user.id})}
        else
            render json: {error: 'Invalid username/password combination.'}
        end
    end

    def validate
    user = get_current_user
    if user
        render json: {username: user.username, token: issue_token({id: user.id})}
    else
        render json: {error: "User not found"}
        end
    end

    def get_booklets
        user = get_current_user
        if user 
            booklets = []
            user.booklets.each do |booklet| 
                pages = []
                booklet.pages.each do |page|
                    lists = []
                    page.lists.each do |list|
                        lists << { heading: list.heading, sub_heading: list.sub_heading, id: list.id, page_id: list.page_id, list_items: list.list_items }
                    end
                    pages << { title: page.title, booklet_id: page.booklet_id, id: page.id, number: page.number, images: page.images, text_items: page.text_items, lists: lists}
                end
                
                booklets << { title: booklet.title, id: booklet.id, pages: pages}
            end
            render json: booklets

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


