class BookletsSerializer < ActiveModel::Serializer
  attributes :data


  def data
    object.map{ |booklet|
      {
        id: booklet.id,
        title: booklet.title,
        user_id: booklet.user_id,
        published: booklet.published,
        pages: pages(booklet)
      }
    }
  end

  def pages(booklet)

    booklet.pages.map { |page|

      {
        id: page.id,
        title: page.title,
        text_items: page.text_items,
        images: page.images,
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
