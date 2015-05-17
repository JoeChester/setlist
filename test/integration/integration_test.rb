require 'test_helper'

class IntegrationTest < ActionDispatch::IntegrationTest

  setup do #manually login
    post_via_redirect user_session_path, 'user[email]' => 'test@example.org', 'user[password]' => '123greetings'
  end

  test "random renders songs#random" do
    get '/random'
    assert_response :ok
    assert_instance_of SongsController, @controller
    assert_equal 'random', @controller.action_name
  end

  test 'links in navigation bar' do
    get '/random'
    assert_select 'a[href="/songs"]', 'Songs'
    assert_select 'a[href="/random"]', 'Random'
    assert_select 'a[href="/playlists"]', 'Playlists'
    assert_select 'a[href="/gigs"]', 'Gigs'
  end

  test "checklist of songs when creating a new playlist" do
    get "/playlists/new"
    assert_select 'label[for="playlist_song_ids_21"]', "Bon Jovi - It's my life"
    assert_select 'label[for="playlist_song_ids_22"]', "Green Day - BOBD"
  end

  test "should show songs" do
    get "/songs"
    assert_select 'h4.list-group-item-heading', "It's my life"
    assert_select 'h4.list-group-item-heading', "BOBD"
  end

end
