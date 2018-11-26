class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :heading
      t.string :sub_heading
      t.integer :page_id

      t.timestamps
    end
  end
end
