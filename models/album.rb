require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  #Create
  def save()
    sql = "INSERT INTO albums (
    title,
    genre,
    artist_id
    ) VALUES (
      $1, $2, $3
      ) RETURNING *
      ;"
      values = [@title, @genre, @artist_id]
      result = SqlRunner.run(sql, values)
      @id = result[0]['id'].to_i
    end

  #Read
  def Album.list_all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map{|album| Album.new(album)}
  end

  #Read
  def list_album_artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    artist_hash_array = SqlRunner.run(sql, values)
    artist_hash = artist_hash_array[0]
    return Artist.new(artist_hash)
  end

  #Update
  def update()
    sql = "UPDATE albums SET (title, genre) = ($1, $2)
    WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

end
