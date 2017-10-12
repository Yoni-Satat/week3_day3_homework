require('pg')
require_relative('albums.rb')
require_relative('../db/sql_runner.rb')

class Artist
  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
      sql = "
        INSERT INTO artists(name)
        VALUES($1)
        RETURNING *
      "
      values = [@name]
      @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def self.show_all()
        sql = "SELECT * FROM artists"
        values = []
        artists = SqlRunner.run(sql, values)
        artist = artists.map{|artist| Artist.new(artist)}
        return artist
    end

    def self.delete_all()
      sql = "DELETE FROM artists"
      values = []
      SqlRunner.run(sql, values)
  end

  def album()
      sql = "SELECT * FROM albums WHERE id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)

      return results.map {|album| Album.new(album)}
      #
      # artist_data = results[0]
      # artist = Artist.new(artist_data)
      # return artist
    end


end
