require_relative 'extractor'

class Parser
  include Extractor
  #attr_reader :link, :file

  def initialize(argv)
    @link = argv[0]
    @file = argv[1]
  end

  def run
    scraper
  end

  private

  def scraper
    object = Curl.get("https://www.petsonic.com/#{@link}/")

    puts document
  end
end
