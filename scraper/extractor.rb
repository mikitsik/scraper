# frozen_string_literal: true

require 'pry'

# This module extract required data
module Extractor
  def extract(pages, link)
    browse(pages, link)
  end

  private

  PRODUCTS_URLS = './/a[@class="product-name"]/@href'
  MULTIPRODUCT = './/label[contains(@class, "label_comb_price")]'
  PRODUCT_NAME = './/h1[@class="product_main_name"]'
  PRODUCT_WEIGHT = './span[@class="radio_label"]'
  PRODUCT_PRICE = './span[@class="price_comb"]'
  PRODUCT_IMAGE = './/img[@id="bigpic"]/@src'

  #:reek:FeatureEnvy
  def browse(pages, link)
    data = [%w[Name Price Image]]
    pages.times do |page|
      puts "\n\nCrawling on page # #{page + 1}"
      url = Curl.get(page.zero? ? link : link + "?p=#{page + 1}").body_str
      data += crawl(Nokogiri::HTML(url))
    end
    data
  end

  def crawl(page)
    urls = page.xpath(PRODUCTS_URLS)
    puts "Detected #{urls.size} items on this page"
    print 'Extracting data'
    page_data = []
    urls.each do |url|
      page_data += fetch(Nokogiri::HTML(Curl.get(url.value).body_str))
    end
    page_data
  end

  def fetch(item_page)
    page_data = []
    item_page.xpath(MULTIPRODUCT).each do |product|
      print '.'
      item_data = []
      item_data << item_page.xpath(PRODUCT_NAME).text + ' - ' + product.xpath(PRODUCT_WEIGHT).text
      item_data << product.xpath(PRODUCT_PRICE).text
      item_data << item_page.xpath(PRODUCT_IMAGE).text
      page_data << item_data
    end
    page_data
  end
end
