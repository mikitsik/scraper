# frozen_string_literal: true

# This module calculate amount of the pages
module Paginator
  def paginate(research)
    calculate_pages(research)
  end

  private

  PATH = './/div[contains(@class, "product-count")]'
  REGEX = /\d+\s*de\s*\d+/.freeze

  #:reek:UtilityFunction
  def calculate_pages(research)
    raw_amount = research.xpath(PATH).text.match(REGEX)[0].split(' ')
    (raw_amount[2].to_f / raw_amount[0].to_f).ceil
  end
end
