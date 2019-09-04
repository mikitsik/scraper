# frozen_string_literal: true

# This module extract required data
module Extractor
  def extract(pages, link)
    browse(pages, link)
  end

  private

  #:reek:FeatureEnvy
  def browse(pages, link)
    pages.times do |page|
      url = Curl.get(page.zero? ? link : link + "?p=#{page + 1}").body_str
      crawl(Nokogiri::HTML(url))
    end
  end

  def crawl(page)
    page.xpath('.//a[@class="product-name"]/@href').each do |url|
      fetch(Nokogiri::HTML(url))
    end
  end

  def fetch

  end
end
