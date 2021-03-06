class ImagesController < ApplicationController

  def create
    image = Image.create(title: params[:title], url: params[:url], booklet_id: params[:booklet_id])
    render json: get_current_user.booklets, serializer: BookletsSerializer
  end


  def update
    image = Image.find(params[:id])
    image.update(title: params[:title], url: params[:url])
    render json: get_current_user.booklets, serializer: BookletsSerializer
  end 

end