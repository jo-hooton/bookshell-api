class Page < ApplicationRecord
    belongs_to :booklet
    has_many :images
    has_many :text_items
    has_many :lists
end
