class BookletsSerializer < ActiveModel::Serializer
  attributes :data

  def data {
    :id,
    :title,
    :user_id,
    :pages
  }
end
