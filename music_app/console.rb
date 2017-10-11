require('pry')
require_relative('models/albums.rb')
require_relative('models/artists.rb')

artist_1 = Artist.new({'name' => 'Bobo the killer'})
artist_2 = Artist.new({'name' => 'Henrieta and the Chickens'})
artist_3 = Artist.new({'name' => 'Sneaks and Ladders'})


album_1 = Album.new({
    'title' => 'Living The Dream',
    'genre' => 'pop',
    'artist_id' => artist_1.id
    })

album_2 = Album.new({
  'title' => 'Old Moon',
  'genre' => 'country',
  'artist_id' => artist_2.id
  })

album_3 = Album.new({
  'title' => 'Baby Boom',
  'genre' => 'techno',
  'artist_id' => artist_3.id
  })

  binding.pry
  nil
