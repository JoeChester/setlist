class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :rating
      t.timestamp :last_practiced
      t.integer :number_of_practices
      t.text :comment

      t.timestamps null: false
    end
  end
end
