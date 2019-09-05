# frozen_string_literal: true

# This class writes data into csv file
class Recorder
  def initialize(data, file)
    @data = data
    @file = file
  end

  def printing
    write
  end

  private

  def write
    print "\n\nWriting data to #{@file}.csv"
    CSV.open("#{@file}.csv", 'w') { |csv| row_extractor(csv) }
  end

  def row_extractor(csv)
    @data.each do |row|
      print '.'
      csv << row
    end
  end
end
