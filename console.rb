require('pry-byebug')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Prince'})
artist1.save()

artist2 = Artist.new({'name' => 'Foo Fighters'})
artist2.save()

album1 = Album.new({
  'title' => 'Purple Rain',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album1.save()

album2 = Album.new({
  'title' => 'Diamonds and Pearls',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album2.save()

album3 = Album.new({
  'title' => 'Sonic Highways',
  'genre' => 'Rock',
  'artist_id' => artist2.id
  })
album3.save()

artists = Artist.list_all()

albums = Album.list_all()

artist_albums = artist1.list_artist_albums()

album_artist = album1.list_album_artist()

artist1.name = 'Symbol'
artist1.update()

album1.genre = 'Pop'
album1.update()


binding.pry
nil
