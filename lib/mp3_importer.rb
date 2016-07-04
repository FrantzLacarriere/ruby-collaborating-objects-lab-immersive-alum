require 'pry'

class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    Dir.glob(path+"**/*.mp3").map {|file| file.split("/")[4]}
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
