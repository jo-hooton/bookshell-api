class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title
      t.string :url
      t.integer :booklet_id

      t.timestamps
    end
  end
end
