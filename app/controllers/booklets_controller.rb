class BookletsController < ApplicationController

    def index
        @booklets = Booklet.all
        render json: @booklets, serializer: BookletsSerializer
    end

    def create
        user = get_current_user
        @booklet = Booklet.create(user_id: user.id, title: params[:title], published: false) 
        render json: @booklet
    end

    def update
        user = get_current_user
        @booklet = Booklet.find(params[:id])
        Booklet.update(user_id: user.id, title: params[:title], published: params[:published])
        pages = @booklet.pages
        @page = Page.create(title: params[:title], booklet_id: @booklet.id)
        render json: @booklet
    end


    def show
        @booklet = Booklet.find(params[:id])
    end

    def get_pages
        @booklet = Booklet.find(params[:id])
        pages = []
        @booklet.pages.each do |page|
            lists = []
            page.lists.each do |list|
                lists << { heading: list.heading, sub_heading: list.sub_heading, id: list.id, page_id: list.page_id, list_items: list.list_items }
            end
            pages << { title: page.title, booklet_id: page.booklet_id, id: page.id, number: page.number, images: page.images, text_items: page.text_items, lists: lists}
        end
    end

    def publish_booklet
        booklet = Booklet.find(params[:id])
        if booklet.published
            booklet.update(published: false)
        else
            booklet.update(published: true)
        end
        render json: get_current_user.booklets, serializer: BookletsSerializer
    end

end