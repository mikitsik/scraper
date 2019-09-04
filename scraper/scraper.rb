require 'nokogiri'
require 'csv'
require 'curb'

puts ARGV[0]

http = Curl.get('https://www.petsonic.com/snacks-huesos-para-perros/')

document = Nokogiri::HTML(http.body_str)

document.xpath('.//a[@class="product-name"]/@href').each do |url|
  puts url
end
