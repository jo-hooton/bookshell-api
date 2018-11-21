class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title
      t.integer :number
      t.integer :booklet_id

      t.timestamps
    end
  end
end
