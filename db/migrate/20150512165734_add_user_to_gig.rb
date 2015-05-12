class AddUserToGig < ActiveRecord::Migration
  def change
    add_reference :gigs, :user, index: true, foreign_key: true
  end
end
