require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = User.first
    @megan = users(:megan)
    sign_in @user
    @song = songs(:one)
    @bobd_song = songs(:two)
    @other_song = songs(:three)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:songs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post :create, song: { artist: @song.artist, comment: @song.comment, last_practiced: @song.last_practiced, number_of_practices: @song.number_of_practices, rating: @song.rating, title: @song.title }
    end

    assert_redirected_to song_path(assigns(:song))
  end

  test "should show song" do
    get :show, id: @song
    assert_response :success
  end

  test "should not show song of other user" do
    get :show, id: @other_song
    assert_redirected_to songs_path
  end

  test "should get random" do
    get :random
    assert_includes(Song.where(:user => @user), assigns(:song))
  end

  test "should redirect when no songs are created" do
    sign_in @megan
    get :random
    assert_redirected_to songs_path
    sign_in @user
  end

  test "should increase practice counter" do
    before = @song.number_of_practices
    get :practice, id: @song
    after = assigns(:song).number_of_practices
    assert_equal(before + 1, after)
  end

  test "should not practice songs of other users" do
    sign_in @megan
    get :practice, id: @song
    assert_redirected_to songs_path
    sign_in @user
  end

  test "should upvote songs" do
    before = @song.rating
    get :upvote, id: @song
    after = assigns(:song).rating
    assert_equal(before + 1, after)
  end

  test "should not upvote songs of other users" do
    sign_in @megan
    get :upvote, id: @song
    assert_redirected_to songs_path
    sign_in @user
  end

  test "should downvote songs" do
    before = @song.rating
    get :downvote, id: @song
    after = assigns(:song).rating
    assert_equal(before - 1, after)
  end

  test "should not downvote unrated songs" do
    before = @bobd_song.rating #this is 0
    get :downvote, id: @bobd_song
    after = assigns(:song).rating
    assert_equal(before, after)
  end

  test "should not downvote songs of other users" do
    sign_in @megan
    get :downvote, id: @song
    assert_redirected_to songs_path
    sign_in @user
  end

  test "should get edit" do
    get :edit, id: @song
    assert_response :success
  end

  test "should update song" do
    patch :update, id: @song, song: { artist: @song.artist, comment: @song.comment, last_practiced: @song.last_practiced, number_of_practices: @song.number_of_practices, rating: @song.rating, title: @song.title }
    assert_redirected_to song_path(assigns(:song))
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete :destroy, id: @song
    end

    assert_redirected_to songs_path
  end
end
