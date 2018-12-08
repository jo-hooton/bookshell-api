class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :heading
      t.string :sub_heading
      t.string :image
      t.string :bio
      t.string :linkedin
      t.string :github
      t.integer :page_id

      t.timestamps
    end
  end
end
