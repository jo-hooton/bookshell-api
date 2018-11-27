class PagesController < ApplicationController

    def create

        @page = Page.create(booklet_id: params[:bookletId], title: params[:title]) 

        if params[:textItem]
            @text_item = TextItem.create(heading: params[:heading], sub_heading: params[:subHeading], content: params[:content], page_id: @page.id)
        end

        if params[:image]
            @image = Image.create(title: params[:title], url: params[:image], page_id: @page.id)
        end

        if params[:list]
            @list = List.create(title: params[:title], page_id: @page.id)
            params[:listItems].each do |list_item| 
            ListItem.create(heading: list[:heading], sub_heading: list[:subHeading], content: list[:content], list_id: @list.id)
            end
        end

        if params[:gallery]
            @gallery = Gallery.create(heading: params[:heading], sub_heading: params[:subHeading], page_id: @page.id)
            params[:galleryItems].each do |gallery_item| 
            GalleryItem.create(image: gallery[:image], heading: gallery[:heading], sub_heading: gallery[:subHeading], content: gallery[:content], gallery_id: @gallery.id)
            end
        end



        render json: @page
    end

end