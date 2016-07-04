require 'pry'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(some_filename)
    file_array = some_filename.split(" - ")
    song_name = file_array[1]
    artist_name = file_array[0]
    song = self.new(song_name)
    song.artist_name(artist_name)
    song
  end

  def artist_name(name)
    song = self
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(song)
    artist.save
    self.artist = artist
  end


end
