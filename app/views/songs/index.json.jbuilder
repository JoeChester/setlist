json.array!(@songs) do |song|
  json.extract! song, :id, :title, :artist, :rating, :last_practiced, :number_of_practices, :comment
  json.url song_url(song, format: :json)
end
