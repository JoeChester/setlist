class Song < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :playlists
  validates :title, presence: true
  def full_display
    "#{artist} - #{title}"
  end
end
