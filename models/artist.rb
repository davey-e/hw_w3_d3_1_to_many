require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  #Create
  def save()
    sql = "INSERT INTO artists(name)
    VALUES($1)
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  #Read
  def Artist.list_all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map{|artist| Artist.new(artist)}
  end

  #Read
  def list_artist_albums()
    sql = "SELECT * FROM albums
    WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|album| Album.new(album)}
  end

  #Update
  def update()
    sql = "UPDATE artists SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  #Delete
  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
