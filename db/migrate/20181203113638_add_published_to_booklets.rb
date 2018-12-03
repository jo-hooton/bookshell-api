class AddPublishedToBooklets < ActiveRecord::Migration[5.2]
  def change
    add_column :booklets, :published, :boolean
  end
end
