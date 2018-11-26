class PagesController < ApplicationController

    def create
        @page = Page.create(booklet_id: booklet.id, title: params[:title], number: params[:number]) 
        render json: @page
    end

end