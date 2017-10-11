require('pg')
require_relative('artists.rb')

class Album
  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end


end
