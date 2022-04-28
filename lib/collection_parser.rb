require 'nokogiri'
require 'open-uri'
require 'addressable'

module CollectionParser
  def self.read_from_wiki
    uri = URI.open(Addressable::URI.encode(::URL_WIKI))

    doc = Nokogiri::HTML(uri)

    collection = doc.css('table.standard.sortable tbody tr')[1..].map do |item|
      {
        title: item.css('td')[1].text.strip,
        year: item.css('td')[2].text.to_i,
        producer: item.css('td')[3].text.strip,
        genre: item.css('td')[4].text.strip
      }
    end

    FilmsCollection.new(collection)
  end
end
