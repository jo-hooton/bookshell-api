class BookletSerializer < ActiveModel::Serializer
  attributes :data


  def data
    {
    title: object.title,
    id: object.id,
    image: object.image,
    pages: pages
    }
  end

  def pages
    object.pages.map { |page|
      {
        id: page.id,
        title: page.title,
        text_items: page.text_items,
        lists: lists(page),
        galleries: galleries(page)
      }

    }
    
  end

  def lists(page)
    
    page.lists.map { |list|

      {
        id: list.id,
        heading: list.heading,
        sub_heading: list.sub_heading,
        list_items: list.list_items
      }

    }

   end


  def galleries(page)
    
    page.galleries.map { |gallery|

      {
        id: gallery.id,
        heading: gallery.heading,
        sub_heading: gallery.sub_heading,
        gallery_items: gallery.gallery_items
      }

    }

   end
end
