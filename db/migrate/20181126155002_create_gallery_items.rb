class CreateGalleryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_items do |t|
      t.string :image
      t.string :heading
      t.string :sub_heading
      t.string :content
      t.integer :gallery_id

      t.timestamps
    end
  end
end
