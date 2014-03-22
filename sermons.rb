require 'csv'


class Sermon

  attr_reader :speaker, :subject, :venue, :conference, :year, :file

  def initialize(speaker, subject, venue, conference, year, file)
    @speaker = speaker
    @subject = subject
    @venue = venue
    @conference = conference
    @year = year
    @file = file
  end

  def self.read_csv(csv)
    sermons_array = []
    CSV.foreach(csv, headers:true) do |row|
      sermons_array << Sermon.new(row["Speaker"], row["Subject"], row["Venue"], row["Conference"], row["Year"], row["File"])
    end
    sermons_array
  end

  def make_array
    [@speaker, @subject, @venue, @conference, @year, @file]
  end

end





