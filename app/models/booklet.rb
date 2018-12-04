class Booklet < ApplicationRecord
    belongs_to :user
    has_many :pages
    has_one :image
end
