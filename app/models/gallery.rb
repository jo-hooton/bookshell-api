class Gallery < ApplicationRecord
    belongs_to :page
    has_many :gallery_items
end
