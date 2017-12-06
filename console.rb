require('pry-byebug')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')

artist1 = Artist.new({'name' => 'Prince'})

artist1.save()

album1 = Album.new({
  'title' => 'Purple Rain',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })

album1.save()

artists = Artist.list_all()


binding.pry
nil
