class Playlist < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :songs
  accepts_nested_attributes_for :songs
end
