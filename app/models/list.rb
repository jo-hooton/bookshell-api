class List < ApplicationRecord
    belongs_to :page
    has_many :list_items
end
