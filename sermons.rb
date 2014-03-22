require 'pry'
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
end

@sermons_array = []
CSV.foreach('messages_index.csv', headers:true) do |row|
  @sermons_array << Sermon.new(row["Speaker"], row["Subject"], row["Venue"], row["Conference"], row["Year"], row["File"])
end

