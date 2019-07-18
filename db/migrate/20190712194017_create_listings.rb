class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :condition
      t.integer :price
      t.string :notes
      t.integer :user_id
      t.integer :album_id

      t.timestamps
    end
  end
end
