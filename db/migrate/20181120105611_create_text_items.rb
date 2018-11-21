class CreateTextItems < ActiveRecord::Migration[5.2]
  def change
    create_table :text_items do |t|
      t.string :heading
      t.string :sub_heading
      t.string :content
      t.integer :page_id

      t.timestamps
    end
  end
end
