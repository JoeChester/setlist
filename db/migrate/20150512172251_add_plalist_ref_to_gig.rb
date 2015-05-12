class AddPlalistRefToGig < ActiveRecord::Migration
  def change
    add_reference :gigs, :playlist, index: true, foreign_key: true
  end
end
