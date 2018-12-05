class PagesController < ApplicationController

    def create

        @page = Page.create(booklet_id: params[:bookletId], title: params[:pageTitle]) 
        
        if params[:textItem]
            @text_item = TextItem.create(heading: params[:textItem][:heading], sub_heading: params[:textItem][:subHeading], content: params[:textItem][:content], page_id: @page.id)
        end

        if params[:listItems]
            @list = List.create(heading: params[:heading], sub_heading: params[:subHeading], page_id: @page.id)
            params[:listItems].each do |list_item| 
            ListItem.create(heading: list_item[:heading], content: list_item[:content], list_id: @list.id)
            end
        end

        if params[:galleryItems]
            @gallery = Gallery.create(heading: params[:heading], sub_heading: params[:subHeading], page_id: @page.id)
            params[:galleryItems].each do |gallery_item| 
            GalleryItem.create(image: gallery_item[:image], heading: gallery_item[:heading], sub_heading: gallery_item[:subHeading], content: gallery_item[:content], gallery_id: @gallery.id)
            end
        end

        render json: @page
    end

    def update
        @page = Page.find(params[:id])

        if params[:textItem]
            @text_item = TextItem.find(params[:id])
            TextItem.update(heading: params[:textItem][:heading], sub_heading: params[:textItem][:subHeading], content: params[:textItem][:content], page_id: @page.id)
        end

        if params[:listItems]
            @list = List.find(params[:id])
            List.update(heading: params[:heading], sub_heading: params[:subHeading], page_id: @page.id)
            params[:listItems].each do |list_item| 
            ListItem.find(params[:id])
            ListItem.update(heading: list_item[:heading], content: list_item[:content], list_id: @list.id)
            end
        end

        if params[:galleryItems]
            @gallery = Gallery.find(params[:id])
            Gallery.update(heading: params[:heading], sub_heading: params[:subHeading], page_id: @page.id)
            params[:galleryItems].each do |gallery_item| 
            GalleryItem.find(params[:id])
            GalleryItem.update(image: gallery_item[:image], heading: gallery_item[:heading], sub_heading: gallery_item[:subHeading], content: gallery_item[:content], gallery_id: @gallery.id)
            end
        end

        render json: @page
    end

end