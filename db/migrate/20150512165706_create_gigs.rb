class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.timestamp :date
      t.string :location
      t.text :comment

      t.timestamps null: false
    end
  end
end
