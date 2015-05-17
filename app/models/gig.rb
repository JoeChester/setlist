class Gig < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist
  validates :location, presence: true
end
