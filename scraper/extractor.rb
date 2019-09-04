module Extractor
  def extract(document)
    fetch(document)
  end

  private

  def fetch(document)
    document.xpath('.//div[@class="product-count hidden-xs"]').each do |url|
      puts url
    end
  end


end
