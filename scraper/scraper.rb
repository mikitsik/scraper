# frozen_string_literal: true

require 'nokogiri'
require 'csv'
require 'curb'
require_relative 'parser'

parser = Parser.new(ARGV)

parser.run

# document = Nokogiri::HTML(http.body_str)

# while (c = Curl::Easy.perform(pagination == 1 ? options.link : "#{options.link}?p=#{pagination}")).response_code == 200

# document.xpath('.//a[@class="product-name"]/@href').each do |url|
#   puts url
# end
