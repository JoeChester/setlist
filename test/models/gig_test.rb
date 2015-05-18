require 'test_helper'

class GigTest < ActiveSupport::TestCase

  test 'should be invalid without location' do
    assert_no_difference 'Gig.count' do
      Gig.new(:location => "").save()
    end
  end

  test 'should be invalid without playlist' do
    assert_no_difference 'Gig.count' do
      Gig.new(:location => "Karlsruhe").save()
    end
  end

  test 'should be valid with playlist and location' do
    assert_difference 'Gig.count' do
      Gig.new(:location => "Karlsruhe", :playlist_id => "3").save()
    end
  end

end
