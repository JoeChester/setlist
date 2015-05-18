require 'test_helper'

class SongTest < ActiveSupport::TestCase

  test 'should be invalid without title' do
    assert_no_difference 'Song.count' do
      Song.new(:title => "").save()
    end
  end

end
