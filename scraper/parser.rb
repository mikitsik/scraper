# frozen_string_literal: true

require_relative 'extractor'
require_relative 'paginator'

# This class parsing the site
class Parser
  include Extractor
  include Paginator

  def initialize(argv)
    @link = "https://www.petsonic.com/#{argv[0]}/"
    @file = argv[1]
  end

  def run
    scraper
  end

  private

  def scraper
    # page = 1
    # while (link = Curl.get(page == 1 ? @link : @link + "?p=#{page}")).response_code == 200
    #   extract(Nokogiri::HTML(link.body_str))
    #   puts (link = Curl.get("https://www.petsonic.com/#{@link}?p=2")).response_code
    #   page += 1
    #   puts page
    # end

    pages = paginate(Nokogiri::HTML(Curl.get(@link).body_str))
    extract(pages, @link)
  end
end
