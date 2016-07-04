require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self unless @@all.map {|song| song.name}.include? self.name
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    @@all.find {|song| song.name == name} || self.new(name)
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
