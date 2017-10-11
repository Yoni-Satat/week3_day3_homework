require('pg')
require_relative('artists.rb')
require_relative('../db/sql_runner')

class Album
  attr_accessor :title, :genre, :artist_id, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    return SqlRunner.run(sql, values).map {|album| Album.new(album)}
  end

  def save()
      sql = "
        INSERT INTO albums (title, genre, artist_id)
        VALUES ($1, $2, $3)
        RETURNING *
      "
      values = [@title, @genre, @artist_id]
      @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def self.delete_all()
      sql = "DELETE FROM albums"
      values = []
      SqlRunner.run(sql, values)
  end

  def artist()
      sql = "SELECT * FROM artists WHERE artist_id = $1"
      values = [@id]
      SqlRunner.run(sql, values).map{|artist| Artist.new(artist)}
    end


end
