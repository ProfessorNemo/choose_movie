class FilmsCollection
  attr_accessor :collection, :user_input

  def initialize(collection)
    @collection = collection
  end

  def producers
    collection.map { |item| item[:producer] }.uniq
  end

  def show_producers
    producers.map.with_index(1) do |producer, index|
      "#{index}: #{producer}"
    end
  end

  def choice_producer
    collection.select { |item| item[:producer] == producers[user_input] }.sample
  end
end
