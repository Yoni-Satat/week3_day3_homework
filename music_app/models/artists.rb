require('pg')
require_relative('albums.rb')
require_relative('../db/sql_runner.rb')

class Artist
  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
      sql = "
        INSERT INTO artists(name)
        VALUES($1)
        RETURNING id
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


end
