require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase

  test 'has correct associations' do
    assert_equal :has_and_belongs_to_many, Playlist.reflect_on_association(:songs).macro
  end

  test 'should be invalid without name' do
    assert_no_difference 'Playlist.count' do
      Playlist.new(:name => "").save()
    end
  end

end
