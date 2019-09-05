# frozen_string_literal: true

require_relative 'extractor'
require_relative 'paginator'

# This class parsing the site
class Parser
  include Extractor
  include Paginator

  def initialize(site_caregory)
    @link = "https://www.petsonic.com/#{site_caregory}/"
  end

  def run
    scraper
  end

  private

  def scraper
    pages = paginate(Nokogiri::HTML(Curl.get(@link).body_str))
    extract(pages, @link)
  end
end
