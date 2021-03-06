class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = self.new_by_name(string)
    song.save
    song
  end

  def self.find_by_name(string)
    self.all.find {|song| song.name == string}
  end

  def self.find_or_create_by_name(string)
    song = self.find_by_name(string)
    if song
      song
    else
      self.create_by_name(string)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song_name)
    title = song_name.split(".")
    song_name = title[0].split(" - ")[1]
    artist_name = title[0].split(" - ")[0]
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_name)
    song = self.new_from_filename(song_name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end
end
